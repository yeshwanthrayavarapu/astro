import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:life_pattern/features/birth_profile/presentation/widgets/steps/step_header.dart';

class BirthDateStep extends StatefulWidget {
  const BirthDateStep({
    super.key,
    this.initialDate,
    required this.onNext,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime> onNext;

  @override
  State<BirthDateStep> createState() => _BirthDateStepState();
}

class _BirthDateStepState extends State<BirthDateStep> {
  late DateTime _selectedDate;
  late DateTime _focusedMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime(2000, 1, 1);
    _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
  }

  void _onDaySelected(DateTime day) {
    setState(() {
      _selectedDate = day;
    });
  }

  void _onMonthChanged(int offset) {
    setState(() {
      _focusedMonth =
          DateTime(_focusedMonth.year, _focusedMonth.month + offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepHeader(
          currentStep: 1,
          totalSteps: 3,
          title: 'Your birth date',
          subtitle: 'This helps us generate your unique blueprint',
        ),
        const SizedBox(height: 32),

        // Calendar Card
        Container(
          padding: const EdgeInsets.all(16),
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
          ),
          child: Column(
            children: [
              // Month Navigation
              _CalendarHeader(
                focusedMonth: _focusedMonth,
                onMonthChanged: _onMonthChanged,
              ),
              const SizedBox(height: 24),

              // Days Grid
              _CalendarGrid(
                focusedMonth: _focusedMonth,
                selectedDate: _selectedDate,
                onDaySelected: _onDaySelected,
              ),

              const SizedBox(height: 16),

              // Selected Date Display (Interactive Feedback)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3E5F5), // Light purple background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  DateFormat('MMMM d, yyyy').format(_selectedDate),
                  style: const TextStyle(
                    color: Color(0xFF6200EA),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        // Next Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton(
            onPressed: () => widget.onNext(_selectedDate),
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

class _CalendarHeader extends StatelessWidget {
  const _CalendarHeader({
    required this.focusedMonth,
    required this.onMonthChanged,
  });

  final DateTime focusedMonth;
  final ValueChanged<int> onMonthChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => onMonthChanged(-1),
          icon: const Icon(Icons.chevron_left),
          color: const Color(0xFF1A1A1A),
        ),

        // Month Year Selector (Dropdown style in future, simple text for now)
        Row(
          children: [
            Text(
              DateFormat('MMMM yyyy').format(focusedMonth),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, color: Color(0xFF7E909A)),
          ],
        ),

        IconButton(
          onPressed: () => onMonthChanged(1),
          icon: const Icon(Icons.chevron_right),
          color: const Color(0xFF1A1A1A),
        ),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({
    required this.focusedMonth,
    required this.selectedDate,
    required this.onDaySelected,
  });

  final DateTime focusedMonth;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDaySelected;

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
        DateUtils.getDaysInMonth(focusedMonth.year, focusedMonth.month);
    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
    // 0 for Sunday, 1 for Monday...
    // Wait, DateTime.weekday: 1=Mon, 7=Sun.
    // Screenshot starts with Sunday 'S'.
    // If we map 7(Sun) to 0, and 1(Mon) to 1.
    final offset = firstDayOfMonth.weekday == 7 ? 0 : firstDayOfMonth.weekday;

    final weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Column(
      children: [
        // Weekday Headers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays
              .map((d) => Text(
                    d,
                    style: const TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),

        // Days
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: daysInMonth + offset,
          itemBuilder: (context, index) {
            if (index < offset) return const SizedBox();

            final day = index - offset + 1;
            final date = DateTime(focusedMonth.year, focusedMonth.month, day);
            final isSelected = DateUtils.isSameDay(date, selectedDate);

            return InkWell(
              onTap: () => onDaySelected(date),
              borderRadius: BorderRadius.circular(24),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFF6200EA) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
