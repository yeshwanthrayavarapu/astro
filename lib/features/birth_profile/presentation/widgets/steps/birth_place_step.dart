import 'package:flutter/material.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/place_search_field.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/step_header.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart';

class BirthPlaceStep extends StatefulWidget {
  const BirthPlaceStep({
    super.key,
    this.initialPlace,
    required this.onNext,
  });

  final String? initialPlace;
  final Function(String name, double lat, double lng, String timezone) onNext;

  @override
  State<BirthPlaceStep> createState() => _BirthPlaceStepState();
}

class _BirthPlaceStepState extends State<BirthPlaceStep> {
  String? _selectedPlace; // Display name
  double? _lat;
  double? _lng;
  String? _timezone;

  @override
  void initState() {
    super.initState();
    _selectedPlace = widget.initialPlace;
  }

  void _onPlaceSelected(String name, double lat, double lng) {
    String tz = 'UTC';
    try {
      tz = latLngToTimezoneString(lat, lng);
    } catch (_) {}

    setState(() {
      _selectedPlace = name;
      _lat = lat;
      _lng = lng;
      _timezone = tz.isEmpty ? 'UTC' : tz;
    });
  }

  void _submit() {
    if (_selectedPlace == null || _lat == null || _lng == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please search for and select a place.')),
      );
      return;
    }

    widget.onNext(_selectedPlace!, _lat!, _lng!, _timezone!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepHeader(
          currentStep: 3,
          totalSteps: 3,
          title: 'Where were you born?',
          subtitle: 'Your location determines your house system.',
        ),
        const SizedBox(height: 32),

        // Search Field
        PlaceSearchField(
          onPlaceSelected: _onPlaceSelected,
          initialValue: _selectedPlace,
        ),

        if (_selectedPlace != null) ...[
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3E5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE1BEE7)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF6200EA)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedPlace!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      Text(
                        'Timezone: $_timezone',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF7E909A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],

        const Spacer(),

        // Next Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton(
            onPressed: _submit,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF6200EA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Review Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
