import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/services/language_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/home/presentation/widgets/show_card.dart';
import 'package:webrofm/l10n/app_localizations.dart';

// ---------------------------------------------------------------------------
// Provider: paginated new arrivals from GET /api/shows/?language=xx
// ---------------------------------------------------------------------------

class _NewArrivalsState {
  final List<Show> shows;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final int page;

  const _NewArrivalsState({
    this.shows = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMore = true,
    this.error,
    this.page = 1,
  });

  _NewArrivalsState copyWith({
    List<Show>? shows,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    int? page,
  }) =>
      _NewArrivalsState(
        shows: shows ?? this.shows,
        isLoading: isLoading ?? this.isLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        hasMore: hasMore ?? this.hasMore,
        error: error,
        page: page ?? this.page,
      );
}

class _NewArrivalsNotifier extends StateNotifier<_NewArrivalsState> {
  final dynamic _repository; // ShowRepository
  final String? _languageCode;

  _NewArrivalsNotifier(this._repository, this._languageCode)
      : super(const _NewArrivalsState());

  Future<void> load({bool refresh = false}) async {
    if (state.isLoading || state.isLoadingMore) return;

    if (refresh) {
      state = const _NewArrivalsState(isLoading: true);
    } else if (state.page == 1) {
      state = state.copyWith(isLoading: true, error: null);
    } else {
      if (!state.hasMore) return;
      state = state.copyWith(isLoadingMore: true);
    }

    final page = refresh ? 1 : state.page;

    final result = await _repository.getShowsList(
      languageCode: _languageCode,
      page: page,
    );

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: failure.message,
      ),
      (newShows) {
        // Enrich with NEW chip: created_at < 7 days
        final enriched = (newShows as List<Show>).map((s) {
          final isRecent = s.createdAt != null &&
              DateTime.now().difference(s.createdAt!).inDays < 7;
          return s.copyWith(isNew: s.isNew || isRecent);
        }).toList();

        final allShows = refresh ? enriched : [...state.shows, ...enriched];
        state = state.copyWith(
          shows: allShows,
          isLoading: false,
          isLoadingMore: false,
          // Backend page size is 20 — if fewer returned, no more pages
          hasMore: enriched.length >= 20,
          page: page + 1,
          error: null,
        );
      },
    );
  }
}

final _newArrivalsProvider =
    StateNotifierProvider.autoDispose<_NewArrivalsNotifier, _NewArrivalsState>(
  (ref) {
    final repo = ref.watch(showRepositoryProvider);
    final lang = ref.watch(languageProvider).languageCode;
    final notifier = _NewArrivalsNotifier(repo, lang);
    notifier.load();
    return notifier;
  },
);

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class NewArrivalsScreen extends ConsumerStatefulWidget {
  const NewArrivalsScreen({super.key});

  @override
  ConsumerState<NewArrivalsScreen> createState() => _NewArrivalsScreenState();
}

class _NewArrivalsScreenState extends ConsumerState<NewArrivalsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    // Load more when user is 300px from the bottom
    if (pos.pixels >= pos.maxScrollExtent - 300) {
      ref.read(_newArrivalsProvider.notifier).load();
    }
  }

  Future<void> _onRefresh() async {
    await ref.read(_newArrivalsProvider.notifier).load(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_newArrivalsProvider);
    final cs = context.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.homeNewArrivals,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: cs.primary,
        child: _buildBody(context, state, cs),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context, _NewArrivalsState state, ColorScheme cs) {
    if (state.isLoading && state.shows.isEmpty) {
      return _buildShimmerGrid(context);
    }

    if (state.error != null && state.shows.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded, size: 48, color: cs.onSurface.withValues(alpha: 0.3)),
            const SizedBox(height: 12),
            Text(
              state.error!,
              style: context.textTheme.bodyMedium?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: _onRefresh,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        // Match ShowCard AspectRatio (1131/1600) + title text height (~42px)
        childAspectRatio: 1131 / (1600 + 600),
      ),
      itemCount: state.shows.length + (state.isLoadingMore ? 3 : 0),
      itemBuilder: (context, index) {
        if (index >= state.shows.length) {
          return _shimmerCard(context);
        }
        final show = state.shows[index];
        return ShowCard(
          show: show,
          showNewBadge: show.isNew,
          onTap: () => context.push('/show/${show.id}'),
        );
      },
    );
  }

  Widget _buildShimmerGrid(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
    final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        childAspectRatio: 1131 / (1600 + 600),
      ),
      itemCount: 15,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: base,
        highlightColor: highlight,
        child: Container(
          decoration: BoxDecoration(
            color: base,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _shimmerCard(BuildContext context) {
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
  }
}
