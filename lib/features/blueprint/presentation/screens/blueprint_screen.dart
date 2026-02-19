import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:life_pattern/features/blueprint/application/blueprint_providers.dart';
import 'package:life_pattern/features/blueprint/domain/pattern_template.dart';
import 'package:life_pattern/features/blueprint/domain/user_pattern.dart';
import 'package:life_pattern/features/blueprint/presentation/widgets/pattern_card.dart';
import 'package:life_pattern/features/blueprint/presentation/widgets/pill_tab_control.dart';

class BlueprintScreen extends ConsumerStatefulWidget {
  const BlueprintScreen({super.key});

  @override
  ConsumerState<BlueprintScreen> createState() => _BlueprintScreenState();
}

class _BlueprintScreenState extends ConsumerState<BlueprintScreen> {
  int _selectedTabIndex = 0;
  final _categories = ['core_self', 'growth', 'relationships'];
  final _tabNames = ['Core Self', 'Growth', 'Relationships'];

  @override
  void initState() {
    super.initState();
    // Trigger pattern assignment if needed (fire and forget)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(blueprintControllerProvider.notifier); // Init controller
    });
  }

  @override
  Widget build(BuildContext context) {
    final userPatternsAsync = ref.watch(userPatternsProvider);
    final templatesAsync = ref.watch(patternTemplatesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Light grey background
      body: userPatternsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text('Error: $err')),
        data: (userPatterns) {
          return templatesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, st) => Center(child: Text('Error: $err')),
            data: (templates) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                        child: Column(
                          children: [
                            Text(
                              'Your Blueprint',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Serif',
                                  ),
                            ),
                            const SizedBox(height: 24),
                            PillTabControl(
                              tabs: _tabNames,
                              selectedIndex: _selectedTabIndex,
                              onTabSelected: (index) {
                                setState(() {
                                  _selectedTabIndex = index;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Pattern List
                  if (userPatterns.isEmpty)
                    SliverFillRemaining(
                      child: _buildEmptyState(context),
                    )
                  else
                    _buildPatternList(
                      context,
                      _categories[_selectedTabIndex],
                      userPatterns,
                      templates,
                    ),

                  const SliverPadding(
                      padding:
                          EdgeInsets.only(bottom: 100)), // Space for bottom nav
                ],
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
    List<UserPattern> userPatterns,
    List<PatternTemplate> templates,
  ) {
    // Filter patterns for this category
    final categoryPatterns = userPatterns.where((p) {
      // Find template
      final template = templates.firstWhere(
        (t) => t.id == p.patternTemplateId,
        orElse: () => const PatternTemplate(
          id: 'unknown',
          title: 'Unknown',
          shortDescription: '',
          longDescription: '',
          category: 'unknown',
          reflectionPrompts: [],
          iconName: 'star',
        ),
      );
      return template.category == category;
    }).toList();

    if (categoryPatterns.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Icon(Icons.inbox, size: 48, color: Colors.grey.shade300),
              const SizedBox(height: 16),
              Text(
                'No patterns yet in this category.',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final pattern = categoryPatterns[index];
            final template = templates.firstWhere(
              (t) => t.id == pattern.patternTemplateId,
              orElse: () => const PatternTemplate(
                id: 'unknown',
                title: 'Unknown Pattern',
                shortDescription: '...',
                longDescription: '...',
                category: 'unknown',
                reflectionPrompts: [],
                iconName: 'star',
              ),
            );

            return PatternCard(
              userPattern: pattern,
              template: template,
              onTap: () {
                context.push('/blueprint/detail/${pattern.id}');
              },
            );
          },
          childCount: categoryPatterns.length,
        ),
      ),
    );
  }
}
