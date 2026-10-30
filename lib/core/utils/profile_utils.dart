import 'package:flutter/painting.dart';
import 'package:webrofm/core/constants/app_constants.dart';
import 'package:webrofm/core/constants/asset_paths.dart';
import 'package:webrofm/features/home/domain/entities/category.dart';

/// Returns the default avatar image to show when the user has not uploaded a
/// profile picture. Picks the image based on the user's gender. When gender is
/// not set, picks a stable random avatar derived from [seed] (e.g. the user's
/// id) so it does not change on every rebuild.
String defaultAvatarForGender(String? gender, {String seed = ''}) {
  switch (gender?.toLowerCase()) {
    case 'male':
      return AssetPaths.maleAvatar;
    case 'female':
      return AssetPaths.femaleAvatar;
    default:
      final useMale = seed.isEmpty || seed.hashCode.isEven;
      return useMale ? AssetPaths.maleAvatar : AssetPaths.femaleAvatar;
  }
}

/// Returns the [ImageProvider] for the user's profile picture. Falls back to
/// the gender-based default avatar when no picture is set (null or empty
/// string) or when it cannot be resolved to a valid URL.
ImageProvider avatarImageProvider(
  String? avatar, {
  String? gender,
  String seed = '',
}) {
  final value = avatar?.trim();
  if (value == null || value.isEmpty) {
    return AssetImage(defaultAvatarForGender(gender, seed: seed));
  }
  return NetworkImage(resolveMediaUrl(value));
}

/// Converts category IDs (as strings) to display names using preload categories.
List<String> categoryIdsToNames(
  List<String> ids,
  List<ShowCategory> categories,
) {
  final map = {for (final c in categories) c.id: c.name};
  return ids.map((id) => map[id] ?? id).toList();
}

/// Converts category names to category IDs using preload categories.
List<int> categoryNamesToIds(
  List<String> names,
  List<ShowCategory> categories,
) {
  final map = {for (final c in categories) c.name: int.tryParse(c.id)};
  return names
      .map((n) => map[n] ?? int.tryParse(n) ?? 0)
      .where((id) => id != 0)
      .toList();
}

/// Resolves a relative media path to a full URL.
String resolveMediaUrl(String? path) {
  if (path == null || path.isEmpty) return path ?? '';
  if (path.startsWith('http://') || path.startsWith('https://')) return path;
  if (path.startsWith('/')) return '${AppConstants.baseUrl}${path.substring(1)}';
  return '${AppConstants.baseUrl}$path';
}

/// Resolves legacy relative public R2 image paths while preserving full URLs.
String? resolvePublicImageUrl(String? path) {
  final value = path?.trim();
  if (value == null || value.isEmpty) return null;
  if (value.startsWith('http://') || value.startsWith('https://')) return value;
  return '${AppConstants.r2PublicUrl}/${value.replaceFirst(RegExp(r'^/+'), '')}';
}
