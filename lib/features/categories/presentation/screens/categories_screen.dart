import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = context.colorScheme;
    final homeState = ref.watch(homeNotifierProvider);
    final categories = homeState.categories;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Text(
                  l10n.categoriesTitle,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            if (homeState.isLoading && categories.isEmpty)
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final isDark = Theme.of(context).brightness == Brightness.dark;
                    final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
                    final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
                    return Shimmer.fromColors(
                      baseColor: base,
                      highlightColor: highlight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: base,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    );
                  },
                  childCount: 6,
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final category = categories[index];
                      final showCount = _countShowsForCategory(homeState.trending, category.name);
                      return _buildCategoryTile(
                        context, cs, category, showCount, l10n,
                        () => context.push('/category/${Uri.encodeComponent(category.name)}'),
                      );
                    },
                    childCount: categories.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  int _countShowsForCategory(List<Show> shows, String categoryName) {
    return shows.where((s) =>
        (s.category ?? '').toLowerCase() == categoryName.toLowerCase()).length;
  }

  Widget _buildCategoryTile(
    BuildContext context,
    ColorScheme cs,
    ShowCategory category,
    int showCount,
    AppLocalizations l10n,
    VoidCallback onTap,
  ) {
    final icon = _categoryIcon(category.name);
    final gradient = _categoryGradient(category.name);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: gradient.first.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                icon,
                size: 80,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: context.surfaceWhite(),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: context.glassBorder(),
                        width: 1,
                      ),
                    ),
                    child: Icon(icon, size: 24, color: gradient.first),
                  ),
                  const Spacer(),
                  Text(
                    category.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.categoriesShowCount(showCount),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _categoryIcon(String name) {
    switch (name.toLowerCase()) {
      case 'drama':
        return Icons.theater_comedy_rounded;
      case 'comedy':
        return Icons.emoji_emotions_rounded;
      case 'podcasts':
        return Icons.podcasts_rounded;
      case 'music':
        return Icons.music_note_rounded;
      case 'kids':
        return Icons.child_care_rounded;
      case 'devotional':
        return Icons.self_improvement_rounded;
      case 'news':
        return Icons.newspaper_rounded;
      case 'sports':
        return Icons.sports_rounded;
      case 'crime & killing':
      case 'crime':
        return Icons.gavel_rounded;
      case 'paranormal & supernatural':
      case 'paranormal':
        return Icons.auto_fix_high_rounded;
      case 'mystery & investigations':
      case 'mystery':
        return Icons.search_rounded;
      case 'heist & robbery':
      case 'heist':
        return Icons.lock_outline_rounded;
      case 'train disasters':
        return Icons.train_rounded;
      case 'cosmic accidents':
        return Icons.public_rounded;
      case 'earthquake disasters':
        return Icons.crisis_alert_rounded;
      case 'folklore horror':
      case 'horror':
        return Icons.dark_mode_rounded;
      case 'metroes':
        return Icons.directions_subway_rounded;
      case 'age of thrones':
        return Icons.emoji_events_rounded;
      case 'love & romance':
      case 'romance':
        return Icons.favorite_rounded;
      case 'war & combat':
      case 'war':
        return Icons.shield_rounded;
      case 'general':
        return Icons.category_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  List<Color> _categoryGradient(String name) {
    const palettes = [
      [Color(0xFF603ed3), Color(0xFFae3115)],
      [Color(0xFFff6b4a), Color(0xFF603ed3)],
      [Color(0xFFae3115), Color(0xFFff6b4a)],
      [Color(0xFF603ed3), Color(0xFF795aee)],
      [Color(0xFFff6b4a), Color(0xFFae3115)],
      [Color(0xFF795aee), Color(0xFF603ed3)],
      [Color(0xFF3d5a80), Color(0xFF603ed3)],
      [Color(0xFF2d6a4f), Color(0xFF1b4332)],
    ];
    return palettes[name.hashCode.abs() % palettes.length];
  }
}
