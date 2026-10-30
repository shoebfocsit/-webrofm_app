import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webrofm/core/services/audio_player_service.dart';
import 'package:webrofm/core/services/player_provider.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';

class MiniPlayerWidget extends ConsumerWidget {
  final EdgeInsetsGeometry? margin;

  const MiniPlayerWidget({
    super.key,
    this.margin,
  });

  static const double miniPlayerHeight = 60.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlaying = ref.watch(nowPlayingProvider);
    final hasPlayer = nowPlaying.episode != null && !nowPlaying.isMiniPlayerDismissed;

    if (!hasPlayer) {
      return const SizedBox.shrink();
    }

    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final episode = nowPlaying.episode!;
    final service = ref.read(audioPlayerServiceProvider);

    final progressRatio = (nowPlaying.duration.inMilliseconds > 0)
        ? (nowPlaying.position.inMilliseconds / nowPlaying.duration.inMilliseconds).clamp(0.0, 1.0)
        : 0.0;

    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final defaultBottomMargin = bottomPadding > 0 ? bottomPadding + 8 : 12.0;
    final effectiveMargin = margin ?? EdgeInsets.fromLTRB(16, 0, 16, defaultBottomMargin);

    return Container(
      height: miniPlayerHeight,
      margin: effectiveMargin,
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1B2637).withValues(alpha: 0.95)
            : Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? Colors.white.withValues(alpha: 0.12) : Colors.black.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push('/video-player/${episode.showId}', extra: episode),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: 44,
                          height: 44,
                          child: LocalCachedImage(
                            imageUrl: nowPlaying.showThumbnail,
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                            errorWidget: (_, __, ___) => Container(
                              color: cs.primary.withValues(alpha: 0.15),
                              child: Icon(Icons.headphones_rounded, size: 20, color: cs.primary),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              episode.title,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              nowPlaying.showTitle ?? 'Webro FM Original',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 11,
                                color: cs.onSurface.withValues(alpha: 0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => service.togglePlayPause(),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [cs.primary, cs.primary.withValues(alpha: 0.8)],
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: cs.primary.withValues(alpha: 0.35),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            nowPlaying.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed: () => service.dismissMiniPlayer(),
                        icon: Icon(Icons.close_rounded, size: 18, color: cs.onSurface.withValues(alpha: 0.5)),
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: progressRatio,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: cs.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
