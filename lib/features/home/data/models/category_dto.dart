import 'package:webrofm/features/home/domain/entities/category.dart';

class ShowCategoryDTO {
  final String id;
  final String name;
  final String? icon;
  final int showCount;
  final String? gradient;
  final String? slug;

  const ShowCategoryDTO({
    required this.id,
    required this.name,
    this.icon,
    this.showCount = 0,
    this.gradient,
    this.slug,
  });

  factory ShowCategoryDTO.fromJson(Map<String, dynamic> json) =>
      ShowCategoryDTO(
        id: (json['id'] ?? '').toString(),
        name: json['name'] as String? ?? '',
        icon: json['icon'] as String?,
        showCount: (json['show_count'] as num?)?.toInt() ?? 0,
        gradient: json['gradient'] as String?,
        slug: json['slug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'show_count': showCount,
        'gradient': gradient,
        'slug': slug,
      };

  ShowCategory toDomain() => ShowCategory(
        id: id,
        name: name,
        icon: icon,
        showCount: showCount,
        gradient: gradient,
      );

  factory ShowCategoryDTO.fromDomain(ShowCategory category) =>
      ShowCategoryDTO(
        id: category.id,
        name: category.name,
        icon: category.icon,
        showCount: category.showCount,
        gradient: category.gradient,
      );
}
