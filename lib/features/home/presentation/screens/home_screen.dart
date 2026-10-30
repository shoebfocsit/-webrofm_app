import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/services/audio_player_service.dart';
import 'package:webrofm/core/services/player_provider.dart';
import 'package:webrofm/core/services/language_provider.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/features/home/domain/entities/continue_play.dart';
import 'package:webrofm/features/home/presentation/providers/home_provider.dart';
import 'package:webrofm/features/home/presentation/widgets/show_card.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';
import 'package:webrofm/shared/widgets/network_ping_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _carouselIndex = 0;
  int _carouselLen = 0;
  Timer? _autoScrollTimer;
  String _lastLangCode = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  void _goNext() {
    if (!mounted || _carouselLen == 0) return;
    setState(() {
      _carouselIndex = (_carouselIndex + 1) % _carouselLen;
    });
    _startAutoScroll();
  }

  void _goPrevious() {
    if (!mounted || _carouselLen == 0) return;
    setState(() {
      _carouselIndex = (_carouselIndex - 1 + _carouselLen) % _carouselLen;
    });
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      _goNext();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeNotifierProvider);
    final cs = context.colorScheme;
    final isLoading = homeState.isLoading || homeState.isTrendingLoading;
    _syncCarouselLength(homeState.trending.length);

    final langCode = ref.watch(languageProvider).languageCode;
    if (langCode != _lastLangCode) {
      _lastLangCode = langCode;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(homeNotifierProvider.notifier).fetchAll(languageCode: langCode);
        }
      });
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(homeNotifierProvider.notifier).refresh(languageCode: ref.read(languageProvider).languageCode),
        child: CustomScrollView(
          cacheExtent: 500,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            _buildAppBar(context, cs),
            if (isLoading && homeState.trending.isEmpty)
              SliverToBoxAdapter(
                child: _buildShimmerLoading(context),
              )
            else ...[
              SliverToBoxAdapter(
                child: RepaintBoundary(
                  child: _buildHeroCarousel(context, cs, homeState),
                ),
              ),
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, ref, _) {
                    final nowPlaying = ref.watch(nowPlayingProvider);
                    if (nowPlaying.episode == null) return const SizedBox.shrink();
                    return _buildContinuePlayingSection(context, cs, nowPlaying);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Consumer(
                  builder: (context, ref, _) {
                    final continueList = ref.watch(homeNotifierProvider).continuePlay;
                    if (continueList.isEmpty) return const SizedBox.shrink();
                    return _buildContinueWatchingSection(context, cs, continueList);
                  },
                ),
              ),
              // Hide New Arrivals header+section when list is empty (not loading)
              if (homeState.newArrivals.isNotEmpty || homeState.isLoading || homeState.isNewArrivalsLoading) ...
                [
                  SliverToBoxAdapter(
                    child: _buildSectionHeader(
                      context, AppLocalizations.of(context)!.homeNewArrivals,
                      onSeeAll: () => context.push('/new-arrivals'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _buildNewArrivalsSection(context, cs, homeState),
                  ),
                ],
              SliverToBoxAdapter(
                child: _buildSectionHeader(
                  context, AppLocalizations.of(context)!.homePopularNow,
                  onSeeAll: () => context.push('/trending'),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildPopularNowSection(context, cs, homeState),
              ),
              ..._buildCategoryShowSections(context, cs, homeState).expand((w) => [
                SliverToBoxAdapter(child: w),
              ]).toList(),
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.bottom + 12),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _syncCarouselLength(int length) {
    if (length <= 0 || length == _carouselLen) return;
    _carouselLen = length;
    _carouselIndex %= length;
    _startAutoScroll();
  }

  Widget _buildAppBar(BuildContext context, ColorScheme cs) {
    return SliverToBoxAdapter(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: context.mediaQuery.viewPadding.top + 8,
              bottom: 12,
            ),
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
                Image.asset(
                  context.appLogoPath,
                  height: 40,
                  fit: BoxFit.contain,
                ),
                const Spacer(),
                const NetworkPingIndicator(),
                const SizedBox(width: 8),
                _buildIconButton(context, Icons.g_translate, () => context.push('/languages', extra: 'app')),
                const SizedBox(width: 8),
                _buildIconButton(context, Icons.notifications_outlined, () => context.push('/notifications')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context.surfaceWhite(opacity: 0.5),
        shape: BoxShape.circle,
        border: Border.all(
          color: context.glassBorder(),
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _buildHeroCarousel(BuildContext context, ColorScheme cs, HomeState state) {
    if (state.trending.isEmpty) {
      return _buildShimmerCarousel(context);
    }
    final mq = MediaQuery.of(context);
    final stackWidth = mq.size.width;
    const cardHeight = 420.0;
    final cardWidth = cardHeight * (1130 / 1600);
    const cardRadius = 16.0;
    const peekWidth = 40.0;
    final peekW = cardWidth * 0.82;
    final peekH = cardHeight * 0.88;
    final peekTop = (cardHeight - peekH) / 2;
    const centerTop = 6.0;

    final shows = state.trending;
    final window = shows.length < 5 ? shows.length : 5;
    final start = -(window ~/ 2);

    return SizedBox(
      height: cardHeight + 40,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity == null) return;
          if (details.primaryVelocity! < -200) {
            _goNext();
          } else if (details.primaryVelocity! > 200) {
            _goPrevious();
          }
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            for (final offset in _carouselOffsets(window, start))
              _buildCarouselSlot(
                context, cs,
                show: shows[(_carouselIndex + offset) % shows.length],
                offset: offset,
                stackWidth: stackWidth,
                cardWidth: cardWidth,
                cardHeight: cardHeight,
                peekW: peekW,
                peekH: peekH,
                peekWidth: peekWidth,
                peekTop: peekTop,
                centerTop: centerTop,
                cardRadius: cardRadius,
              ),
          ],
        ),
      ),
    );
  }

  List<int> _carouselOffsets(int window, int start) {
    final offsets = [for (var o = start; o < start + window; o++) o];
    return [...offsets.where((o) => o != 0), 0];
  }

  Widget _buildCarouselSlot(
    BuildContext context, ColorScheme cs, {
    required Show show,
    required int offset,
    required double stackWidth,
    required double cardWidth,
    required double cardHeight,
    required double peekW,
    required double peekH,
    required double peekWidth,
    required double peekTop,
    required double centerTop,
    required double cardRadius,
  }) {
    final isCenter = offset == 0;
    return AnimatedPositioned(
      key: ValueKey('carousel-${show.id}'),
      duration: const Duration(milliseconds: 950),
      curve: Curves.easeInOutCubic,
      left: _carouselLeftFor(offset, stackWidth, cardWidth, peekW, peekWidth),
      top: isCenter ? centerTop : peekTop,
      child: _buildCarouselCard(
        context, cs, show,
        isCenter: isCenter,
        cardWidth: isCenter ? cardWidth : peekW,
        cardHeight: isCenter ? cardHeight : peekH,
        cardRadius: cardRadius,
      ),
    );
  }

  double _carouselLeftFor(int offset, double stackWidth, double cardWidth, double peekW, double peekWidth) {
    switch (offset) {
      case -2:
        return -peekW - 60;
      case -1:
        return peekWidth - cardWidth * 0.30;
      case 0:
        return (stackWidth - cardWidth) / 2;
      case 1:
        return stackWidth - peekW - (peekWidth - cardWidth * 0.30);
      default:
        return stackWidth + 60;
    }
  }

  Widget _buildCarouselCard(
    BuildContext context, ColorScheme cs, Show show, {
    required bool isCenter,
    required double cardWidth,
    required double cardHeight,
    required double cardRadius,
  }) {
    final userLang = ref.watch(languageProvider).languageCode;
    final carouselDesc = show.descriptionFor(userLang);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 950),
      curve: Curves.easeInOutCubic,
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isCenter ? 0.35 : 0.2),
            blurRadius: isCenter ? 16 : 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => context.push('/show/${show.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cardRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              LocalCachedImage(
                imageUrl: show.backdropUrl ?? show.posterUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                borderRadius: cardRadius,
                placeholder: (_, __) => _shimmerBox(double.infinity, double.infinity, cardRadius, context),
                errorWidget: (_, __, ___) => _errorBox(context),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: isCenter ? 0.8 : 0.65),
                    ],
                  ),
                ),
              ),
              if (isCenter) ...[
                Positioned(
                  top: 12,
                  right: 12,
                  child: _buildRatingPill(context, show.rating),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: show.category != null
                      ? _buildCategoryChip(context, show.category!)
                      : const SizedBox.shrink(),
                ),
                Positioned(
                  bottom: 18,
                  left: 18,
                  right: 18,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        show.title,
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      if (carouselDesc.isNotEmpty)
                        Text(
                          carouselDesc,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingPill(BuildContext context, double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: context.surfaceWhite(),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: context.glassBorder(),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 14, color: Colors.amber.shade600),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: context.surfaceWhite(),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: context.glassBorder(),
          width: 0.5,
        ),
      ),
      child: Text(
        category,
        style: context.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _buildContinuePlayingSection(BuildContext context, ColorScheme cs, NowPlayingState nowPlaying) {
    final episode = nowPlaying.episode!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final service = ref.read(audioPlayerServiceProvider);
    final totalSec = nowPlaying.duration.inSeconds;
    final posSec = nowPlaying.position.inSeconds;
    final progress = totalSec > 0 ? (posSec / totalSec) : 0.0;

    final mins = posSec ~/ 60;
    final secs = posSec % 60;
    final timeStr = '$mins:${secs.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? const Color(0xFF1B2637).withValues(alpha: 0.9)
              : Colors.white.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: cs.primary.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: cs.primary.withValues(alpha: isDark ? 0.18 : 0.1),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push('/video-player/${episode.showId}', extra: episode),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: 62,
                            height: 62,
                            child: LocalCachedImage(
                              imageUrl: nowPlaying.showThumbnail ?? episode.thumbnailUrl,
                              width: 62,
                              height: 62,
                              fit: BoxFit.cover,
                              errorWidget: (_, __, ___) => Container(
                                color: cs.primary.withValues(alpha: 0.15),
                                child: Icon(Icons.headphones_rounded, color: cs.primary),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 62,
                          height: 62,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.25),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Icon(
                          nowPlaying.isPlaying ? Icons.equalizer_rounded : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: nowPlaying.isPlaying ? const Color(0xFF00E676) : cs.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                nowPlaying.isPlaying
                                    ? AppLocalizations.of(context)!.videoPlayerNowPlaying
                                    : AppLocalizations.of(context)!.videoPlayerPaused,
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: cs.primary,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 10,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                timeStr,
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: cs.onSurface.withValues(alpha: 0.5),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            episode.title,
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (nowPlaying.showTitle != null)
                            Text(
                              nowPlaying.showTitle!,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: cs.onSurface.withValues(alpha: 0.6),
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress.clamp(0.0, 1.0),
                              backgroundColor: cs.onSurface.withValues(alpha: 0.08),
                              color: cs.primary,
                              minHeight: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => service.togglePlayPause(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: cs.primary.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: cs.primary.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          nowPlaying.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          color: cs.primary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildContinueWatchingSection(BuildContext context, ColorScheme cs, List<ContinuePlay> continuePlay) {
    final homeState = ref.read(homeNotifierProvider);
    final l10n = AppLocalizations.of(context)!;
    final repo = ref.read(showRepositoryProvider);
    final trendingMap = {for (final s in homeState.trending) s.id: s};

    // Show all resume items, even if show not in trending (fallback)
    final items = continuePlay;
    if (items.isEmpty) return const SizedBox.shrink();

    Future<void> resumeItem(ContinuePlay item) async {
      final showId = item.showId;
      final episodeId = item.episodeId;
      final posSec = item.position;
      try {
        final res = await repo.getShowEpisodes(showId);
        final episodes = res.fold((_) => <dynamic>[], (e) => e);
        dynamic target;
        for (final e in episodes) {
          if ((e as dynamic).id == episodeId) { target = e; break; }
        }
        target ??= episodes.isNotEmpty ? episodes.first : null;
        if (target == null) return;
        final ep = target as dynamic;
        final service = ref.read(audioPlayerServiceProvider);
        int idx = 0;
        for (int i = 0; i < episodes.length; i++) {
          if ((episodes[i] as dynamic).id == ep.id) { idx = i; break; }
        }
        try {
          service.setQueue(episodes.cast(), startIndex: idx);
        } catch (_) {}
        await service.play(ep as dynamic, showTitle: trendingMap[showId]?.title, showThumbnail: trendingMap[showId]?.posterUrl);
        await Future.delayed(const Duration(milliseconds: 500));
        await service.seek(Duration(seconds: posSec));
      } catch (_) {}
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              Text(l10n.homeContinueWatching, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              // Manual dismiss for whole section - only if user explicitly wants to clear
              GestureDetector(
                onTap: () => ref.read(homeNotifierProvider.notifier).clearContinueWatching(),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: cs.surfaceContainerHighest, shape: BoxShape.circle),
                  child: Icon(Icons.close_rounded, size: 18, color: cs.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final show = trendingMap[item.showId];
              final pos = item.position;
              final mins = pos ~/ 60;
              final secs = pos % 60;
              final timeLabel = '$mins:${secs.toString().padLeft(2, '0')}';
              // Fallback if show not in trending (still show something so row doesn't disappear)
              final displayShow = show ??
                  Show(
                    id: item.showId,
                    title: 'Show ${item.showId}',
                    posterUrl: null,
                    rating: 0,
                  );
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  width: 140,
                  child: Stack(
                    children: [
                      // Use unbounded height so ShowCard uses AspectRatio branch (consistent size)
                      SizedBox(
                        width: 140,
                        child: ShowCard(show: displayShow, onTap: () => resumeItem(item)),
                      ),
                      Positioned(
                        top: 6,
                        right: 6,
                        child: GestureDetector(
                          onTap: () => ref.read(homeNotifierProvider.notifier).dismissContinueItem(item.episodeId),
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.65),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close_rounded, size: 14, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned(
                        // image height = 140 * (1600/1131) ≈ 198px; bottom of image ≈ 198px; label sits above title
                        bottom: 34,
                        left: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.65), borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.play_arrow_rounded, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text(timeLabel, style: const TextStyle(color: Colors.white, fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {VoidCallback? onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        children: [
          Text(
            title,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                AppLocalizations.of(context)!.homeSeeAll,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPopularNowSection(BuildContext context, ColorScheme cs, HomeState state) {
    if (state.isTrendingLoading && state.trending.isEmpty) {
      return _buildShimmerHorizontalList(itemCount: 5, context: context);
    }
    if (state.trending.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(AppLocalizations.of(context)!.homeNoShows)),
      );
    }
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: state.trending.length,
        itemBuilder: (context, index) {
          final show = state.trending[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 140,
              child: ShowCard(
                show: show,
                onTap: () => context.push('/show/${show.id}'),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewArrivalsSection(BuildContext context, ColorScheme cs, HomeState state) {
    // Use the `recent` list from API directly — backend order is final, no client sort.
    final shows = state.newArrivals;
    if (state.isNewArrivalsLoading && shows.isEmpty) {
      return _buildShimmerHorizontalList(itemCount: 5, context: context);
    }
    if (shows.isEmpty) {
      // Still loading initial data or section is empty — show shimmer if overall loading
      if (state.isLoading) {
        return _buildShimmerHorizontalList(itemCount: 5, context: context);
      }
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: shows.length,
        itemBuilder: (context, index) {
          final show = shows[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(
              width: 140,
              child: ShowCard(
                show: show,
                showNewBadge: true, // always show NEW chip for items in `recent`
                onTap: () => context.push('/show/${show.id}'),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildCategoryShowSections(BuildContext context, ColorScheme cs, HomeState state) {
    final l10n = AppLocalizations.of(context)!;
    final uniqueCategories = <String>{};
    final categoryShows = <String, List<Show>>{};
    for (final show in state.trending) {
      final cat = show.category ?? 'Other';
      if (uniqueCategories.add(cat)) {
        categoryShows[cat] = [];
      }
      categoryShows[cat]!.add(show);
    }
    return categoryShows.entries.map((entry) {
      final shows = entry.value;
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Text(
                    _localizedCategoryName(l10n, entry.key),
                    style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.push('/category/${Uri.encodeComponent(entry.key)}'),
                    child: Text(
                      l10n.homeSeeAll,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  final show = shows[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: 140,
                      child: ShowCard(
                        show: show,
                        onTap: () => context.push('/show/${show.id}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  Widget _buildShimmerLoading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerCarousel(context),
        _buildShimmerSectionHeader(context),
        _buildShimmerHorizontalList(itemCount: 5, context: context),
        _buildShimmerSectionHeader(context),
        _buildShimmerHorizontalList(itemCount: 4, context: context),
      ],
    );
  }

  Widget _buildShimmerCarousel(BuildContext context) {
    final shimmer = _shimmerColors(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Shimmer.fromColors(
        baseColor: shimmer.$1,
        highlightColor: shimmer.$2,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: shimmer.$1,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerSectionHeader(BuildContext context) {
    final shimmer = _shimmerColors(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Shimmer.fromColors(
        baseColor: shimmer.$1,
        highlightColor: shimmer.$2,
        child: Container(
          height: 20,
          width: 150,
          decoration: BoxDecoration(
            color: shimmer.$1,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerHorizontalList({required int itemCount, required BuildContext context}) {
    final shimmer = _shimmerColors(context);
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Shimmer.fromColors(
              baseColor: shimmer.$1,
              highlightColor: shimmer.$2,
              child: Container(
                width: 140,
                height: 210,
                decoration: BoxDecoration(
                  color: shimmer.$1,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _shimmerBox(double w, double h, double radius, BuildContext context) {
    final shimmer = _shimmerColors(context);
    return Shimmer.fromColors(
      baseColor: shimmer.$1,
      highlightColor: shimmer.$2,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: shimmer.$1,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  (Color, Color) _shimmerColors(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? (const Color(0xFF1B2637), const Color(0xFF243244))
        : (Colors.grey.shade300, Colors.grey.shade100);
  }

  Widget _errorBox(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDark ? const Color(0xFF16202F) : Colors.grey.shade200,
      child: const Center(child: Icon(Icons.broken_image_outlined, color: Colors.grey)),
    );
  }

  String _localizedCategoryName(AppLocalizations l10n, String name) {
    switch (name.toLowerCase()) {
      case 'drama':
        return l10n.categoryDrama;
      case 'comedy':
        return l10n.categoryComedy;
      case 'podcasts':
        return l10n.categoryPodcasts;
      case 'music':
        return l10n.categoryMusic;
      case 'kids':
        return l10n.categoryKids;
      case 'devotional':
        return l10n.categoryDevotional;
      case 'news':
        return l10n.categoryNews;
      case 'sports':
        return l10n.categorySports;
      case 'technology':
        return l10n.categoryTechnology;
      case 'education':
        return l10n.categoryEducation;
      case 'business':
        return l10n.categoryBusiness;
      case 'health':
        return l10n.categoryHealth;
      case 'science':
        return l10n.categoryScience;
      case 'arts':
        return l10n.categoryArts;
      default:
        return name;
    }
  }
}
