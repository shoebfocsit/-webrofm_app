import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/core/utils/share_utils.dart';
import 'package:webrofm/features/home/domain/entities/episode.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';

class EpisodeCard extends StatelessWidget {
  final Episode episode;
  final VoidCallback? onPlay;
  final VoidCallback? onTap;
  final double? progress;
  final bool showPlayButton;

  const EpisodeCard({
    super.key,
    required this.episode,
    this.onPlay,
    this.onTap,
    this.progress,
    this.showPlayButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                color: context.surfaceWhite(),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: context.glassBorder(),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 100,
                          height: 70,
                          child: Stack(
                            children: [
                              LocalCachedImage(
                                imageUrl: episode.thumbnailUrl,
                                width: 100,
                                height: 70,
                                fit: BoxFit.cover,
                                borderRadius: 8,
                                placeholder: (_, __) => _shimmerBox(100, 70, context),
                                errorWidget: (_, __, ___) => _errorBox(100, 70, context),
                              ),
                              if (showPlayButton)
                                Positioned.fill(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: onPlay,
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: cs.primary.withValues(alpha: 0.9),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                episode.title,
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    size: 14,
                                    color: cs.onSurface.withValues(alpha: 0.5),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    episode.duration.formatDuration,
                                    style: context.textTheme.bodySmall?.copyWith(
                                      color: cs.onSurface.withValues(alpha: 0.6),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    AppLocalizations.of(context)!.seasonEpisodeFormat(
                                      episode.seasonNumber,
                                      episode.episodeNumber,
                                    ),
                                    style: context.textTheme.bodySmall?.copyWith(
                                      color: cs.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => ShareUtils.shareEpisode(
                          title: episode.title,
                          episodeId: episode.id,
                        ),
                        icon: Icon(
                          Icons.share_outlined,
                          color: cs.onSurface.withValues(alpha: 0.6),
                          size: 20,
                        ),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                      if (showPlayButton)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: IconButton(
                            onPressed: onPlay,
                            icon: Icon(
                              Icons.play_circle_filled_rounded,
                              color: cs.primary,
                              size: 36,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (progress != null && progress! > 0)
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: LinearProgressIndicator(
                        value: progress!.clamp(0.0, 1.0),
                        backgroundColor: cs.onSurface.withValues(alpha: 0.08),
                        color: cs.primary,
                        minHeight: 3,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _shimmerBox(double w, double h, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
  final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
  return Shimmer.fromColors(
    baseColor: base,
    highlightColor: highlight,
    child: Container(
      width: w,
      height: h,
      color: base,
    ),
  );
}

Widget _errorBox(double w, double h, BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  return Container(
    width: w,
    height: h,
    color: isDark ? const Color(0xFF16202F) : Colors.grey.shade200,
    child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
  );
}
