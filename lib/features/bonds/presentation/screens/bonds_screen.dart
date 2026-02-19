import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/bonds/presentation/widgets/bond_card.dart';

class BondsScreen extends StatelessWidget {
  const BondsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final bonds = [
      const _BondData('Alex', 'Partner', 92, null),
      const _BondData('Jordan', 'Best Friend', 88, null),
      const _BondData('Taylor', 'Colleague', 65, null),
      const _BondData('Casey', 'Sibling', 74, null),
      const _BondData('Jamie', 'Mentor', 81, null),
      const _BondData('Riley', 'Ex-Partner', 45, null),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Cosmic Bonds'),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: bonds.length,
        itemBuilder: (context, index) {
          final bond = bonds[index];
          return BondCard(
            name: bond.name,
            relation: bond.relation,
            compatibilityScore: bond.score,
            avatarUrl: bond.avatarUrl,
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/bonds/create'),
        icon: const Icon(Icons.add),
        label: const Text('Add Bond'),
        backgroundColor: const Color(0xFF6200EA),
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _BondData {
  final String name;
  final String relation;
  final int score;
  final String? avatarUrl;

  const _BondData(this.name, this.relation, this.score, this.avatarUrl);
}
