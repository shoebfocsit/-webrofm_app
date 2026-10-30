import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/home/presentation/widgets/show_card.dart';
import 'package:webrofm/l10n/app_localizations.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final searchResultsProvider = FutureProvider.autoDispose<List<Show>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];
  final repository = ref.read(showRepositoryProvider);
  final result = await repository.searchShows(query.trim());
  return result.fold(
    (_) => <Show>[],
    (data) => data,
  );
});

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  bool _isVoiceSupported = false;
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final query = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchResultsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context, cs),
            Expanded(
              child: query.trim().isEmpty
                  ? _buildInitialState(context, cs)
                  : _buildSearchResults(context, cs, searchResults),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, ColorScheme cs) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _debounce?.cancel();
                _debounce = Timer(const Duration(milliseconds: 300), () {
                  if (mounted) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  }
                });
              },
              style: context.textTheme.bodyLarge?.copyWith(fontFamily: 'Outfit'),
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchHint,
              hintStyle: TextStyle(
                color: cs.onSurface.withValues(alpha: 0.4),
                fontFamily: 'Outfit',
              ),
              filled: true,
              fillColor: context.surfaceWhite(opacity: 0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: context.glassBorder(),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: context.glassBorder(),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: cs.primary, width: 2),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: Icon(Icons.search_rounded, size: 22, color: cs.onSurface.withValues(alpha: 0.5)),
              ),
              suffixIcon: _isVoiceSupported
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: cs.primary.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.mic_rounded, size: 20, color: cs.primary),
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState(BuildContext context, ColorScheme cs) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.searchSuggested,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Consumer(
            builder: (context, ref, _) {
              final homeState = ref.watch(homeNotifierProvider);
              final shows = homeState.trending.take(6).toList();
              if (shows.isEmpty) return const SizedBox.shrink();
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.58,
                ),
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  final show = shows[index];
return Center(
                      child: ShowCard(
                        show: show,
                        onTap: () => context.push('/show/${show.id}'),
                      ),
                    );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    ColorScheme cs,
    AsyncValue<List<Show>> results,
  ) {
    return results.when(
      loading: () => GridView.builder(
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
      ),
      error: (err, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline_rounded, size: 48, color: cs.error),
            const SizedBox(height: 12),
            Text(AppLocalizations.of(context)!.searchError, style: context.textTheme.titleMedium),
          ],
        ),
      ),
      data: (shows) {
        if (shows.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: context.surfaceWhite(),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: context.glassBorder(),
                      width: 1,
                    ),
                  ),
                  child: Icon(Icons.search_off_rounded, size: 48, color: cs.onSurface.withValues(alpha: 0.4)),
                ),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.searchNoResults,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.searchNoResultsSubtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: cs.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }
        return GridView.builder(
          cacheExtent: 500,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.58,
          ),
          itemCount: shows.length,
          itemBuilder: (context, index) {
            final show = shows[index];
return Center(
                child: ShowCard(
                  show: show,
                  onTap: () => context.push('/show/${show.id}'),
                ),
              );
          },
        );
      },
    );
  }
}
