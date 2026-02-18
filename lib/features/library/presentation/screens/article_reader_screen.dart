import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_pattern/features/library/application/library_providers.dart';
import 'package:life_pattern/features/library/domain/content_item.dart';

import 'package:url_launcher/url_launcher.dart';

class ArticleReaderScreen extends ConsumerStatefulWidget {
  final String itemId;

  const ArticleReaderScreen({super.key, required this.itemId});

  @override
  ConsumerState<ArticleReaderScreen> createState() =>
      _ArticleReaderScreenState();
}

class _ArticleReaderScreenState extends ConsumerState<ArticleReaderScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showPaywall = false;
  double _lastProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _saveProgress(); // Ensure progress is saved on exit
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final progress = (currentScroll / maxScroll).clamp(0.0, 1.0);

    // Save progress logic (debounce could be added for better performance)
    if ((progress - _lastProgress).abs() > 0.05) {
      _lastProgress = progress;
      // We don't await here to avoid blocking UI
      ref.read(readingProgressControllerProvider).updateProgress(
            itemId: widget.itemId,
            percent: progress,
          );
    }

    // Paywall Logic
    // If premium content AND user not premium AND scrolled past 20%
    // In a real app, user premium status would come from a tailored provider.
    // For MVP, assuming all users are FREE unless we add a flag.
    // Let's assume the user model has an 'isPremium' field or we mock it.
    // For this implementation, let's treat everyone as FREE to demonstrate the paywall
    // unless we see a clear isPremium on the user model.
    // final user = ref.read(authStateProvider).asData?.value;
    final isUserPremium = false; // Mock: set to true to test unlocked

    // We need the item to check if it is premium

    // NOTE: This check inside onScroll is slightly inefficient for item retrieval,
    // but the item is likely cached by the provider we watch in build.
    // Better to check `_isItemPremium` flag set in build.
    if (_isItemPremium && !isUserPremium) {
      if (progress > 0.2 && !_showPaywall) {
        setState(() {
          _showPaywall = true;
        });
      } else if (progress <= 0.2 && _showPaywall) {
        setState(() {
          _showPaywall = false;
        });
      }
    }
  }

  Future<void> _saveProgress() async {
    await ref.read(readingProgressControllerProvider).updateProgress(
          itemId: widget.itemId,
          percent: _lastProgress,
        );
  }

  bool _isItemPremium = false;

  @override
  Widget build(BuildContext context) {
    // We need to fetch the item details.
    // Since items are usually fetched via collection, we might need a specific provider family
    // or just fetch it here. Let's assume we can get it from the repo details provider if we made one,
    // or just use a FutureProvider for single item (we haven't made one yet).
    // Let's fetch direct for MVP or find in previous list.
    // Actually, good practice: create a `contentItemProvider(id)`
    // For now, let's use a FutureBuilder wrapper or just fetch via repo since we omitted that provider.
    final repo = ref.watch(contentRepositoryProvider);

    return FutureBuilder<ContentItem?>(
      future: repo.getItem(widget.itemId), // Simple fetch
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Scaffold(body: Center(child: Text('Article not found')));
        }

        final item = snapshot.data!;
        _isItemPremium = item.isPremium;

        return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                physics: _showPaywall
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    centerTitle: true, // Required for iOS look
                    // Minimal AppBar
                    title: Text(
                      item.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {}, // TODO: Bookmarking
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.grey[700],
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          const SizedBox(height: 24),
                          MarkdownBody(
                            data: item.contentMarkdown,
                            styleSheet: MarkdownStyleSheet(
                              h1: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                              h2: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                              p: const TextStyle(
                                  fontSize: 16,
                                  height: 1.8,
                                  color: Colors.black87),
                              blockquote: const TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                              code: TextStyle(
                                  backgroundColor: Colors.grey[200],
                                  fontSize: 14),
                            ),
                            onTapLink: (text, href, title) async {
                              if (href != null) {
                                final uri = Uri.parse(href);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }
                            },
                          ),
                          // Extra padding at bottom
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Paywall Overlay
              if (_showPaywall)
                Positioned.fill(
                  child: ClipRect(
                    child: Backbone(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.all(24),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.lock,
                                    size: 48, color: Colors.amber),
                                const SizedBox(height: 16),
                                const Text(
                                  'Premium Content',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Subscribe to unlock the full library of insights and patterns.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: Navigate to subscription screen
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Navigate to Premium Plan...')),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
                                  ),
                                  child: const Text('Unlock Premium'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// Helper widget since BackdropFilter implies full screen typically
class Backbone extends StatelessWidget {
  final Widget child;
  final ImageFilter filter;
  const Backbone({super.key, required this.child, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(filter: filter, child: child);
  }
}
