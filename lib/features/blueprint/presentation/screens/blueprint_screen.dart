import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/blueprint/application/blueprint_providers.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';
import 'package:life_pattern/features/blueprint/presentation/widgets/pattern_card.dart';

class BlueprintScreen extends ConsumerStatefulWidget {
  const BlueprintScreen({super.key});

  @override
  ConsumerState<BlueprintScreen> createState() => _BlueprintScreenState();
}

class _BlueprintScreenState extends ConsumerState<BlueprintScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _categories = ['core_self', 'growth', 'relationships'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // Trigger pattern assignment if needed (fire and forget)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(blueprintControllerProvider.notifier); // Init controller
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPatternsAsync = ref.watch(userPatternsProvider);
    final templatesAsync = ref.watch(patternTemplatesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Blueprint'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Core Self'),
            Tab(text: 'Growth'),
            Tab(text: 'Relationships'),
          ],
        ),
      ),
      body: userPatternsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (userPatterns) {
          return templatesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('Error: $err')),
            data: (templates) {
              if (userPatterns.isEmpty) {
                return _buildEmptyState(context);
              }
              return TabBarView(
                controller: _tabController,
                children: _categories.map((category) {
                  return _buildPatternList(
                    context,
                    category,
                    userPatterns,
                    templates,
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Analyzing your chart...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildPatternList(
    BuildContext context,
    String category,
    List<dynamic> userPatterns, // List<UserPattern>
    List<PatternTemplate> templates,
  ) {
    // Filter patterns for this category
    final categoryPatterns = userPatterns.where((p) {
      final template = templates.firstWhere((t) => t.id == p.patternTemplateId);
      return template.category == category;
    }).toList();

    if (categoryPatterns.isEmpty) {
      return Center(
        child: Text('No patterns found in this category.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categoryPatterns.length,
      itemBuilder: (context, index) {
        final pattern = categoryPatterns[index];
        final template =
            templates.firstWhere((t) => t.id == pattern.patternTemplateId);

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: PatternCard(
            userPattern: pattern,
            template: template,
            onTap: () {
              context.push('/blueprint/detail/${pattern.id}');
            },
          ),
        );
      },
    );
  }
}
