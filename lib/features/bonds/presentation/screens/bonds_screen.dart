import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/bonds/application/bond_providers.dart';
import 'package:life_pattern/features/bonds/domain/bond.dart';
import 'package:go_router/go_router.dart';

class BondsScreen extends ConsumerWidget {
  const BondsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bondsAsync = ref.watch(bondsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bonds')),
      body: bondsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (bonds) {
          if (bonds.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.people_outline,
                      size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text('Discover your connections',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  const Text('Create your first bond to see compatibility.'),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => context.push('/bonds/create'),
                    icon: const Icon(Icons.add),
                    label: const Text('Create Bond'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bonds.length,
            itemBuilder: (context, index) {
              final bond = bonds[index];
              return _BondCard(bond: bond);
            },
          );
        },
      ),
      floatingActionButton: bondsAsync.hasValue && bondsAsync.value!.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => context.push('/bonds/create'),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class _BondCard extends StatelessWidget {
  final Bond bond;

  const _BondCard({required this.bond});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/bonds/detail/${bond.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child:
                    Text(bond.otherName.isNotEmpty ? bond.otherName[0] : '?'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bond.otherName,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 4,
                      children: bond.labels
                          .take(2)
                          .map((l) => Text(
                                l,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CircularProgressIndicator(
                    value: bond.scores.overall / 100,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    strokeWidth: 4,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${bond.scores.overall}%',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
