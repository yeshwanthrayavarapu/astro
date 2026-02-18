import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_nominatim/flutter_nominatim.dart';

/// A debounced place-search field backed by OpenStreetMap Nominatim.
///
/// When the user selects a result, [onPlaceSelected] is called with the
/// display name, latitude, and longitude.
class PlaceSearchField extends StatefulWidget {
  const PlaceSearchField({
    super.key,
    required this.onPlaceSelected,
    this.initialValue,
  });

  final void Function(String displayName, double lat, double lng)
      onPlaceSelected;
  final String? initialValue;

  @override
  State<PlaceSearchField> createState() => _PlaceSearchFieldState();
}

class _PlaceSearchFieldState extends State<PlaceSearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  List<Place> _suggestions = [];
  bool _loading = false;
  bool _showSuggestions = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() => _showSuggestions = false);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String query) {
    _debounce?.cancel();
    if (query.length < 3) {
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
        _loading = false;
      });
      return;
    }
    setState(() => _loading = true);
    _debounce = Timer(const Duration(milliseconds: 600), () => _search(query));
  }

  Future<void> _search(String query) async {
    try {
      final results = await Nominatim.instance.search(query);
      if (!mounted) return;
      setState(() {
        _suggestions = results;
        _showSuggestions = results.isNotEmpty;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
        _loading = false;
      });
    }
  }

  void _selectPlace(Place place) {
    _controller.text = place.displayName;
    setState(() {
      _suggestions = [];
      _showSuggestions = false;
    });
    _focusNode.unfocus();
    widget.onPlaceSelected(place.displayName, place.latitude, place.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          onChanged: _onChanged,
          onTap: () {
            if (_suggestions.isNotEmpty) {
              setState(() => _showSuggestions = true);
            }
          },
          decoration: InputDecoration(
            labelText: 'Place of Birth',
            hintText: 'e.g. Sydney, London, New York',
            prefixIcon: const Icon(Icons.place_outlined),
            border: const OutlineInputBorder(),
            suffixIcon: _loading
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : null,
          ),
          validator: (v) {
            if (v == null || v.trim().isEmpty) {
              return 'Please search for and select your place of birth.';
            }
            return null;
          },
        ),

        // Suggestions dropdown
        if (_showSuggestions)
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(30),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 4),
              itemCount: _suggestions.length.clamp(0, 5),
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: cs.outlineVariant),
              itemBuilder: (context, i) {
                final place = _suggestions[i];
                return ListTile(
                  dense: true,
                  leading: Icon(Icons.location_on_outlined,
                      size: 18, color: cs.primary),
                  title: Text(
                    place.displayName,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _selectPlace(place),
                );
              },
            ),
          ),

        // Attribution (Nominatim usage policy)
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '© OpenStreetMap contributors',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
          ),
        ),
      ],
    );
  }
}
