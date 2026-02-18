import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lat_lng_to_timezone/lat_lng_to_timezone.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/place_search_field.dart';

/// Holds the in-progress form state passed to the confirm screen.
class BirthFormData {
  BirthFormData({
    required this.dateOfBirth,
    required this.birthHour,
    required this.birthMinute,
    required this.timeUnknown,
    required this.placeName,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    this.gender,
    this.relationshipStatus,
  });

  final DateTime dateOfBirth;
  final int birthHour;
  final int birthMinute;
  final bool timeUnknown;
  final String placeName;
  final double latitude;
  final double longitude;
  final String timezone;
  final String? gender;
  final String? relationshipStatus;
}

class BirthDataFormScreen extends StatefulWidget {
  const BirthDataFormScreen({super.key});

  @override
  State<BirthDataFormScreen> createState() => _BirthDataFormScreenState();
}

class _BirthDataFormScreenState extends State<BirthDataFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Date
  DateTime? _dateOfBirth;

  // Time
  TimeOfDay? _timeOfBirth;
  bool _timeUnknown = false;

  // Place
  String? _placeName;
  double? _latitude;
  double? _longitude;
  String? _timezone;

  // Optional
  String? _gender;
  String? _relationshipStatus;

  // ---------------------------------------------------------------------------
  // Date picker
  // ---------------------------------------------------------------------------

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth ?? DateTime(1990, 1, 1),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Select your date of birth',
    );
    if (picked != null) {
      setState(() => _dateOfBirth = picked);
    }
  }

  // ---------------------------------------------------------------------------
  // Time picker
  // ---------------------------------------------------------------------------

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _timeOfBirth ?? const TimeOfDay(hour: 12, minute: 0),
      helpText: 'Select your birth time',
    );
    if (picked != null) {
      setState(() => _timeOfBirth = picked);
    }
  }

  // ---------------------------------------------------------------------------
  // Place selection callback
  // ---------------------------------------------------------------------------

  void _onPlaceSelected(String displayName, double lat, double lng) {
    try {
      final tz = latLngToTimezoneString(lat, lng);
      setState(() {
        _placeName = displayName;
        _latitude = lat;
        _longitude = lng;
        _timezone = (tz.isEmpty) ? 'UTC' : tz;
      });
    } catch (e) {
      // Fallback if timezone lookup fails
      setState(() {
        _placeName = displayName;
        _latitude = lat;
        _longitude = lng;
        _timezone = 'UTC';
      });
      _showError('Could not detect timezone. Defaulting to UTC.');
    }
  }

  // ---------------------------------------------------------------------------
  // Submit
  // ---------------------------------------------------------------------------

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    // Extra checks not covered by TextFormField validators
    if (_dateOfBirth == null) {
      _showError('Please select your date of birth.');
      return;
    }
    if (_placeName == null || _latitude == null) {
      _showError('Please search for and select your place of birth.');
      return;
    }
    if (!_timeUnknown && _timeOfBirth == null) {
      _showError('Please select your birth time, or check "I don\'t know".');
      return;
    }

    final hour = _timeUnknown ? 12 : _timeOfBirth!.hour;
    final minute = _timeUnknown ? 0 : _timeOfBirth!.minute;

    final data = BirthFormData(
      dateOfBirth: _dateOfBirth!,
      birthHour: hour,
      birthMinute: minute,
      timeUnknown: _timeUnknown,
      placeName: _placeName!,
      latitude: _latitude!,
      longitude: _longitude!,
      timezone: _timezone ?? 'UTC',
      gender: _gender,
      relationshipStatus: _relationshipStatus,
    );

    context.go('/profile/confirm', extra: data);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Birth Data'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Section: Date ──────────────────────────────────────────
                _SectionHeader(
                    title: 'Date of Birth', icon: Icons.cake_outlined),
                const SizedBox(height: 12),
                _DateTile(
                  date: _dateOfBirth,
                  onTap: _pickDate,
                  cs: cs,
                ),
                const SizedBox(height: 32),

                // ── Section: Time ──────────────────────────────────────────
                _SectionHeader(
                    title: 'Time of Birth', icon: Icons.schedule_outlined),
                const SizedBox(height: 16),

                // "I don't know" checkbox
                CheckboxListTile(
                  value: _timeUnknown,
                  onChanged: (v) => setState(() {
                    _timeUnknown = v ?? false;
                    if (_timeUnknown) _timeOfBirth = null;
                  }),
                  title: const Text("I don't know my exact birth time"),
                  subtitle: _timeUnknown
                      ? Text(
                          'We\'ll use noon (12:00) as default. Accuracy of time-sensitive calculations will be reduced.',
                          style: TextStyle(
                              color: cs.onSurfaceVariant, fontSize: 12),
                        )
                      : null,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),

                if (!_timeUnknown) ...[
                  const SizedBox(height: 8),
                  _TimeTile(
                    time: _timeOfBirth,
                    onTap: _pickTime,
                    cs: cs,
                  ),
                ],
                const SizedBox(height: 32),

                // ── Section: Place ─────────────────────────────────────────
                _SectionHeader(
                    title: 'Place of Birth', icon: Icons.place_outlined),
                const SizedBox(height: 16),
                PlaceSearchField(
                  onPlaceSelected: _onPlaceSelected,
                  initialValue: _placeName,
                ),

                // Timezone chip — shown after place is selected
                if (_timezone != null) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.public, size: 16, color: cs.primary),
                      const SizedBox(width: 6),
                      Text(
                        'Timezone: $_timezone',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: cs.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 32),

                // ── Section: Optional ──────────────────────────────────────
                _SectionHeader(
                  title: 'Optional Details',
                  icon: Icons.tune_outlined,
                  subtitle: 'Used for personalisation — you can skip these.',
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: _gender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('Male')),
                    DropdownMenuItem(value: 'female', child: Text('Female')),
                    DropdownMenuItem(value: 'other', child: Text('Other')),
                    DropdownMenuItem(
                        value: 'prefer_not', child: Text('Prefer not to say')),
                  ],
                  onChanged: (v) => setState(() => _gender = v),
                ),
                const SizedBox(height: 16),

                DropdownButtonFormField<String>(
                  initialValue: _relationshipStatus,
                  decoration: const InputDecoration(
                    labelText: 'Relationship Status',
                    prefixIcon: Icon(Icons.favorite_border),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'single', child: Text('Single')),
                    DropdownMenuItem(
                        value: 'in_relationship',
                        child: Text('In a Relationship')),
                    DropdownMenuItem(value: 'married', child: Text('Married')),
                    DropdownMenuItem(
                        value: 'complicated', child: Text("It's Complicated")),
                    DropdownMenuItem(
                        value: 'prefer_not', child: Text('Prefer not to say')),
                  ],
                  onChanged: (v) => setState(() => _relationshipStatus = v),
                ),
                const SizedBox(height: 32),

                // ── Submit ─────────────────────────────────────────────────
                FilledButton(
                  onPressed: _submit,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(54),
                  ),
                  child: const Text(
                    'Review My Data',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helper widgets
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.icon,
    this.subtitle,
  });

  final String title;
  final IconData icon;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: cs.primary),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
          ),
        ],
      ],
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.date, required this.onTap, required this.cs});

  final DateTime? date;
  final VoidCallback onTap;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final label = date != null
        ? DateFormat('MMMM d, yyyy').format(date!)
        : 'Select date of birth';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: cs.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined,
                color: date != null ? cs.primary : cs.onSurfaceVariant),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: date != null ? cs.onSurface : cs.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimeTile extends StatelessWidget {
  const _TimeTile({required this.time, required this.onTap, required this.cs});

  final TimeOfDay? time;
  final VoidCallback onTap;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final label = time != null ? time!.format(context) : 'Select birth time';

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: cs.outline),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.access_time_outlined,
                color: time != null ? cs.primary : cs.onSurfaceVariant),
            const SizedBox(width: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: time != null ? cs.onSurface : cs.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
