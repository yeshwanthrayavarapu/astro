import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/birth_date_step.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/birth_time_step.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/birth_place_step.dart';

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
  int _currentStep = 1;

  // Data State
  DateTime? _dateOfBirth;
  TimeOfDay? _timeOfBirth;
  bool _timeUnknown = false;
  String? _placeName;
  double? _latitude;
  double? _longitude;
  String? _timezone;

  // ---------------------------------------------------------------------------
  // Navigation
  // ---------------------------------------------------------------------------

  void _onDateNext(DateTime date) {
    setState(() {
      _dateOfBirth = date;
      _currentStep = 2;
    });
  }

  void _onTimeNext(TimeOfDay? time, bool unknown) {
    setState(() {
      _timeOfBirth = time;
      _timeUnknown = unknown;
      _currentStep = 3;
    });
  }

  void _onPlaceNext(String name, double lat, double lng, String tz) {
    setState(() {
      _placeName = name;
      _latitude = lat;
      _longitude = lng;
      _timezone = tz;
    });
    _submit();
  }

  void _onBack() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    } else {
      context.pop();
    }
  }

  void _submit() {
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
    );

    context.go('/profile/confirm', extra: data);
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: _onBack),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar:
          false, // Keep it simple for now, or true if we want background to go up
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _buildCurrentStep(),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 1:
        return BirthDateStep(
          key: const ValueKey(1),
          initialDate: _dateOfBirth,
          onNext: _onDateNext,
        );
      case 2:
        return BirthTimeStep(
          key: const ValueKey(2),
          initialTime: _timeOfBirth,
          initialTimeUnknown: _timeUnknown,
          onNext: _onTimeNext,
        );
      case 3:
        return BirthPlaceStep(
          key: const ValueKey(3),
          initialPlace: _placeName,
          onNext: _onPlaceNext,
        );
      default:
        return const SizedBox();
    }
  }
}
