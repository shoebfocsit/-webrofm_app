import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webrofm/core/utils/extensions.dart';
import 'package:webrofm/features/home/domain/entities/show.dart';
import 'package:webrofm/l10n/app_localizations.dart';
import 'package:webrofm/shared/widgets/local_cached_image.dart';

class ShowCard extends StatelessWidget {
  final Show show;
  final VoidCallback? onTap;
  final bool showNewBadge;
  final bool isFavorite;
  final VoidCallback? onBookmark;

  const ShowCard({
    super.key,
    required this.show,
    this.onTap,
    this.showNewBadge = false,
    this.isFavorite = false,
    this.onBookmark,
  });

  // Dimensions — free to cover available area
  static const double cardWidth = 140;
  static const double cardImageHeight = 210;

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    return _buildCard(context, cs);
  }

  Widget _buildCard(BuildContext context, ColorScheme cs) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Always use AspectRatio so every card is identical in size:
        // same width → same image height → full image, no crop/stretch.
        // Never let parent height constraints push the image to fill remaining space.
        final effectiveWidth =
            constraints.hasBoundedWidth ? constraints.maxWidth : cardWidth;

        Widget buildPosterStack() {
          return Stack(
            fit: StackFit.expand,
            children: [
              LocalCachedImage(
                imageUrl: show.posterUrl,
                fit: BoxFit.cover,
                borderRadius: 12,
                placeholder: (_, __) => _shimmerBox(context),
                errorWidget: (_, __, ___) => _errorBox(context),
              ),
              Positioned(
                bottom: 6,
                left: 6,
                child: _buildRatingBadge(context),
              ),
              if (showNewBadge && show.isNew)
                Positioned(
                  top: 8,
                  left: 8,
                  child: _buildNewBadge(context, cs),
                ),
            ],
          );
        }

        // Always AspectRatio — image is always full-visible, consistent across all cards
        final content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1131 / 1600,
                child: buildPosterStack(),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              show.title,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );

        return SizedBox(
          width: effectiveWidth,
          child: Stack(
            children: [
              GestureDetector(
                onTap: onTap,
                child: content,
              ),
              if (onBookmark != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: _buildBookmarkButton(context),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNewBadge(BuildContext context, ColorScheme cs) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: cs.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        AppLocalizations.of(context)!.showCardNew,
        style: context.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildRatingBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: context.surfaceWhite(),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.glassBorder(),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 12, color: Colors.amber.shade600),
          const SizedBox(width: 3),
          Text(
            show.rating.toStringAsFixed(1),
            style: context.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
}
  
  Widget _buildBookmarkButton(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onBookmark,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 36,
          height: 36,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.6),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
            color: isFavorite ? Colors.red : Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  Widget _shimmerBox(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final base = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;
    final highlight = isDark ? const Color(0xFF243244) : Colors.grey.shade100;
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Container(
        width: ShowCard.cardWidth,
        height: ShowCard.cardImageHeight,
        decoration: BoxDecoration(
          color: base,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _errorBox(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: ShowCard.cardWidth,
      height: ShowCard.cardImageHeight,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF16202F) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
    );
  }
}
