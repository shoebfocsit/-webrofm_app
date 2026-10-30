import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/glass_widgets.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/home/presentation/widgets/show_card.dart';
import 'package:webrofm/features/profile/presentation/providers/profile_provider.dart';
import 'package:webrofm/l10n/app_localizations.dart';

final categoryShowsProvider = FutureProvider.autoDispose.family<List<Show>, String>((ref, category) async {
  final repository = ref.read(showRepositoryProvider);
  final result = await repository.getCategoryShows(category);
  return result.fold(
    (_) => <Show>[],
    (data) => data,
  );
});

final _favoriteIdsProvider = FutureProvider.autoDispose<Set<String>>((ref) async {
  final repository = ref.read(profileRepositoryProvider);
  final result = await repository.getFavorites();
  return result.fold(
    (_) => <String>{},
    (shows) => shows.map((s) => s.id).toSet(),
  );
});

enum _FilterOption { popular, newest, topRated }

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final String category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  ConsumerState<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
  _FilterOption _currentFilter = _FilterOption.popular;
  int _visibleCount = 6;

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final showsAsync = ref.watch(categoryShowsProvider(widget.category));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context, cs),
            Expanded(
              child: showsAsync.when(
                loading: () => _buildShimmerGrid(),
                error: (err, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline_rounded, size: 48, color: cs.error),
                      const SizedBox(height: 12),
                      Text(AppLocalizations.of(context)!.categoryDetailFailed, style: context.textTheme.titleMedium),
                    ],
                  ),
                ),
                data: (shows) {
                  final favoriteIdsAsync = ref.watch(_favoriteIdsProvider);
                  final filtered = _applyFilter(shows);
                  final visible = filtered.take(_visibleCount).toList();

                  return GridView.builder(
                    cacheExtent: 500,
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.58,
                    ),
                    itemCount: visible.length + (visible.length < filtered.length ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= visible.length) {
                        return Center(
                        child: GlassButton(
                          text: AppLocalizations.of(context)!.categoryDetailLoadMore,
                          onPressed: () {
                            setState(() => _visibleCount += 6);
                          },
                          height: 48,
                          width: 160,
                        ),
                      );
                    }
                    final show = visible[index];
                    return favoriteIdsAsync.when(
                      data: (favoriteIds) => ShowCard(
                        show: show,
                        onTap: () => context.push('/show/${show.id}'),
                        isFavorite: favoriteIds.contains(show.id),
                        onBookmark: () async {
                          await ref.read(showRepositoryProvider).toggleFavorite(int.tryParse(show.id) ?? -1);
                          ref.invalidate(_favoriteIdsProvider);
                        },
                      ),
                      loading: () => ShowCard(
                        show: show,
                        onTap: () => context.push('/show/${show.id}'),
                      ),
                      error: (_, __) => ShowCard(
                        show: show,
                        onTap: () => context.push('/show/${show.id}'),
                      ),
                    );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, ColorScheme cs) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.only(left: 4, right: 12, top: 4, bottom: 8),
          decoration: BoxDecoration(
            color: context.surfaceWhite(),
            border: Border(
              bottom: BorderSide(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
              Expanded(
                child: Text(
                  widget.category.capitalizeAllWords,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _showFilterSheet(context, cs),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: context.surfaceWhite(),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: context.glassBorder(),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.filter_list_rounded, size: 18, color: cs.primary),
                      const SizedBox(width: 4),
                      Text(
                        _filterLabel(_currentFilter),
                        style: context.textTheme.labelMedium?.copyWith(
                          color: cs.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Show> _applyFilter(List<Show> shows) {
    switch (_currentFilter) {
      case _FilterOption.popular:
        return shows..sort((a, b) => b.rating.compareTo(a.rating));
      case _FilterOption.newest:
        return shows;
      case _FilterOption.topRated:
        return shows..sort((a, b) => b.rating.compareTo(a.rating));
    }
  }

  String _filterLabel(_FilterOption option) {
    final l10n = AppLocalizations.of(context)!;
    switch (option) {
      case _FilterOption.popular: return l10n.categoryDetailPopular;
      case _FilterOption.newest: return l10n.categoryDetailNewest;
      case _FilterOption.topRated: return l10n.categoryDetailTopRated;
    }
  }

  void _showFilterSheet(BuildContext context, ColorScheme cs) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return _FilterSheet(
          currentFilter: _currentFilter,
          onFilterChanged: (filter) {
            setState(() => _currentFilter = filter);
            context.pop();
          },
        );
      },
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.58,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
        final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
        return Shimmer.fromColors(
          baseColor: base,
          highlightColor: highlight,
          child: Container(
            decoration: BoxDecoration(
              color: base,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}

class _FilterSheet extends StatelessWidget {
  final _FilterOption currentFilter;
  final ValueChanged<_FilterOption> onFilterChanged;

  const _FilterSheet({
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: context.surfaceWhite(opacity: 0.92),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(
                color: context.glassBorder(),
                width: 1,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: cs.onSurface.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.categoryDetailSortBy,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _filterOption(context, _FilterOption.popular, Icons.trending_up_rounded, AppLocalizations.of(context)!.categoryDetailPopular),
              _filterOption(context, _FilterOption.newest, Icons.fiber_new_rounded, AppLocalizations.of(context)!.categoryDetailNewest),
              _filterOption(context, _FilterOption.topRated, Icons.star_rounded, AppLocalizations.of(context)!.categoryDetailTopRated),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterOption(BuildContext context, _FilterOption option, IconData icon, String label) {
    final isSelected = currentFilter == option;
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: () => onFilterChanged(option),
          leading: Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off_rounded,
            color: isSelected ? cs.primary : cs.onSurface.withValues(alpha: 0.5),
          ),
          title: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? cs.primary : cs.onSurface,
            ),
          ),
          trailing: isSelected
              ? Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: cs.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 18, color: cs.primary),
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
