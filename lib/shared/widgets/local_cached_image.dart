import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LocalCachedImage extends StatelessWidget {
  static const int _defaultCacheDimension = 400;

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  const LocalCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fallbackColor = isDark ? const Color(0xFF16202F) : Colors.grey.shade200;
    final placeholderColor = isDark ? const Color(0xFF1B2637) : Colors.grey.shade300;

    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return errorWidget?.call(context, '', '') ??
          Container(
            width: width,
            height: height,
            color: fallbackColor,
            child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
          );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: url,
        cacheKey: _cacheKey(url),
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: _cacheDimension(width, MediaQuery.of(context).devicePixelRatio),
        memCacheHeight: _cacheDimension(height, MediaQuery.of(context).devicePixelRatio),
        filterQuality: FilterQuality.medium,
        placeholder: placeholder ??
            (_, __) => Container(
                  width: width,
                  height: height,
                  color: placeholderColor,
                ),
        errorWidget: errorWidget ??
            (_, __, ___) => Container(
                  width: width,
                  height: height,
                  color: fallbackColor,
                  child: const Icon(Icons.broken_image_outlined, color: Colors.grey),
                ),
      ),
    );
  }

  int? _cacheDimension(double? dimension, double devicePixelRatio) {
    if (dimension == null || dimension.isInfinite || dimension <= 0) {
      return null;
    }
    return (dimension * devicePixelRatio).ceil().clamp(1, 1600).toInt();
  }

  String? _cacheKey(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasQuery || !uri.host.contains('r2.cloudflarestorage.com')) {
      return null;
    }
    return 'image-v2:${uri.replace(query: '', fragment: '')}';
  }
}
