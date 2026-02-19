import 'package:flutter/material.dart';
import 'package:life_pattern/features/timing_cycles/presentation/widgets/cycle_card.dart';

class TimingScreen extends StatelessWidget {
  const TimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final cycles = [
      _CycleData(
        title: 'Saturn Return',
        description:
            'A period of profound maturation and restructuring. You are being asked to take responsibility for your life path.',
        startDate: DateTime.now().subtract(const Duration(days: 30)),
        endDate: DateTime.now().add(const Duration(days: 300)),
        isCurrent: true,
      ),
      _CycleData(
        title: 'Jupiter Trine Natal Sun',
        description:
            'A time of expansion, optimism, and good fortune. Opportunities for growth abound.',
        startDate: DateTime.now().add(const Duration(days: 60)),
        endDate: DateTime.now().add(const Duration(days: 120)),
        isCurrent: false,
      ),
      _CycleData(
        title: 'Mars Square Natal Venus',
        description:
            'Potential tension in relationships or finances. Use this energy to clarify what you truly value.',
        startDate: DateTime.now().add(const Duration(days: 150)),
        endDate: DateTime.now().add(const Duration(days: 180)),
        isCurrent: false,
      ),
      _CycleData(
        title: 'Mercury Retrograde',
        description:
            'A time to review, reflect, and redo. Be careful with communication and contracts.',
        startDate: DateTime.now().add(const Duration(days: 200)),
        endDate: DateTime.now().add(const Duration(days: 221)),
        isCurrent: false,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Cosmic Timing'),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: cycles.length,
        itemBuilder: (context, index) {
          final cycle = cycles[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Logic
                Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: cycle.isCurrent
                            ? const Color(0xFF6200EA)
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        boxShadow: cycle.isCurrent
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF6200EA)
                                      .withValues(alpha: 0.3),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                ),
                              ]
                            : null,
                      ),
                    ),
                    if (index != cycles.length - 1)
                      Container(
                        width: 2,
                        height: 100, // Approximate height of card
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                // Card
                Expanded(
                  child: CycleCard(
                    title: cycle.title,
                    description: cycle.description,
                    startDate: cycle.startDate,
                    endDate: cycle.endDate,
                    isCurrent: cycle.isCurrent,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CycleData {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final bool isCurrent;

  _CycleData({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
  });
}
