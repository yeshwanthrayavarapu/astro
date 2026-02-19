import 'package:flutter/material.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/step_header.dart';

class BirthTimeStep extends StatefulWidget {
  const BirthTimeStep({
    super.key,
    this.initialTime,
    this.initialTimeUnknown = false,
    required this.onNext,
  });

  final TimeOfDay? initialTime;
  final bool initialTimeUnknown;
  final Function(TimeOfDay? time, bool unknown) onNext;

  @override
  State<BirthTimeStep> createState() => _BirthTimeStepState();
}

class _BirthTimeStepState extends State<BirthTimeStep> {
  late TimeOfDay? _selectedTime;
  late bool _timeUnknown;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime ?? const TimeOfDay(hour: 12, minute: 0);
    _timeUnknown = widget.initialTimeUnknown;
    if (_timeUnknown) _selectedTime = null;
  }

  Future<void> _pickTime() async {
    if (_timeUnknown) return;

    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? const TimeOfDay(hour: 12, minute: 0),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6200EA),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _onUnknownChanged(bool? val) {
    setState(() {
      _timeUnknown = val ?? false;
      if (_timeUnknown) {
        _selectedTime = null;
      } else {
        _selectedTime = const TimeOfDay(hour: 12, minute: 0);
      }
    });
  }

  void _submit() {
    if (!_timeUnknown && _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select a time or check "I don\'t know"')),
      );
      return;
    }
    widget.onNext(_selectedTime, _timeUnknown);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepHeader(
          currentStep: 2,
          totalSteps: 3,
          title: 'Your birth time',
          subtitle: 'The exact minute matters for your rising sign',
        ),
        const SizedBox(height: 32),

        // Time Picker Card
        InkWell(
          onTap: _pickTime,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              border: _timeUnknown
                  ? Border.all(color: Colors.grey.shade300)
                  : Border.all(color: const Color(0xFF6200EA), width: 2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 32,
                  color: _timeUnknown ? Colors.grey : const Color(0xFF6200EA),
                ),
                const SizedBox(width: 16),
                Text(
                  _timeUnknown ? '-- : --' : _selectedTime!.format(context),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: _timeUnknown ? Colors.grey : const Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Unknown Checkbox
        CheckboxListTile(
          value: _timeUnknown,
          onChanged: _onUnknownChanged,
          title: const Text("I don't know my exact birth time"),
          subtitle: const Text(
            "We'll use noon (12:00 PM). Some calculations will be approximate.",
            style: TextStyle(fontSize: 12),
          ),
          activeColor: const Color(0xFF6200EA),
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),

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
              'Next',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
