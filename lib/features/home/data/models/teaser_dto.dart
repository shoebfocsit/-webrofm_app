import 'package:webrofm/features/home/domain/entities/teaser.dart';

class TeaserDTO {
  final int id;
  final String title;
  final String? imageUrl;
  final int sequence;
  final bool isActive;
  final bool isConverted;
  final String createdAt;

  const TeaserDTO({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.sequence,
    required this.isActive,
    required this.isConverted,
    required this.createdAt,
  });

  factory TeaserDTO.fromJson(Map<String, dynamic> json) => TeaserDTO(
        id: (json['id'] as num?)?.toInt() ?? 0,
        title: json['title'] as String? ?? '',
        imageUrl: json['image_url'] as String?,
        sequence: (json['sequence'] as num?)?.toInt() ?? 0,
        isActive: json['is_active'] as bool? ?? true,
        isConverted: json['is_converted'] as bool? ?? false,
        createdAt: json['created_at'] as String? ?? DateTime.now().toIso8601String(),
      );

  Teaser toDomain() => Teaser(
        id: id,
        title: title,
        imageUrl: imageUrl,
        sequence: sequence,
        isActive: isActive,
        isConverted: isConverted,
        createdAt: DateTime.parse(createdAt),
      );
}
