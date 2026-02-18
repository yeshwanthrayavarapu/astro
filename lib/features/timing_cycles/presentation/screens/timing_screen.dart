import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/timing_cycles/application/timing_providers.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimingScreen extends ConsumerStatefulWidget {
  const TimingScreen({super.key});

  @override
  ConsumerState<TimingScreen> createState() => _TimingScreenState();
}

class _TimingScreenState extends ConsumerState<TimingScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger generation on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(timingControllerProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeCyclesAsync = ref.watch(activeCyclesProvider);
    final upcomingCyclesAsync = ref.watch(upcomingCyclesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Timing')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOW Section
            Text('NOW', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            activeCyclesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Text('Error: $err'),
              data: (cycles) {
                if (cycles.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          'You are in a neutral period. Rest and integrate.'),
                    ),
                  );
                }
                return Column(
                  children: cycles
                      .map((c) => Card(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            child: ListTile(
                              title: Text(c.title),
                              subtitle: Text(c.theme.toUpperCase()),
                              trailing:
                                  const Icon(Icons.arrow_forward_ios, size: 16),
                              onTap: () {
                                // Navigate to detail
                              },
                            ),
                          ))
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 24),

            // UPCOMING Section
            Text('UPCOMING', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            upcomingCyclesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Text('Error: $err'),
              data: (cycles) {
                if (cycles.isEmpty) {
                  return const Text('No upcoming cycles found.');
                }

                // Sort by start date
                final sorted = List.of(cycles)
                  ..sort((a, b) => a.startDate.compareTo(b.startDate));

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sorted.length,
                  itemBuilder: (context, index) {
                    final cycle = sorted[index];
                    final isLast = index == sorted.length - 1;

                    return TimelineTile(
                      isFirst: index == 0,
                      isLast: isLast,
                      beforeLineStyle: LineStyle(
                          color: Theme.of(context).colorScheme.primary),
                      indicatorStyle: IndicatorStyle(
                        width: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          child: ListTile(
                            title: Text(cycle.title),
                            subtitle: Text(
                                'Starts in ${_daysUntil(cycle.startDate)} days'),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  int _daysUntil(DateTime date) {
    return date.difference(DateTime.now()).inDays;
  }
}
