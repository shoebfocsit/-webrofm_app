import 'package:webrofm/features/home/domain/entities/language.dart';

class LanguageDTO {
  final int id;
  final String name;
  final String code;
  final String? icon;
  final bool isActive;

  const LanguageDTO({
    required this.id,
    required this.name,
    required this.code,
    this.icon,
    required this.isActive,
  });

  factory LanguageDTO.fromJson(Map<String, dynamic> json) => LanguageDTO(
        id: (json['id'] as num?)?.toInt() ?? 0,
        name: json['name'] as String? ?? '',
        code: json['code'] as String? ?? '',
        icon: json['icon'] as String?,
        isActive: json['is_active'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'icon': icon,
        'is_active': isActive,
      };

  Language toDomain() => Language(
        id: id,
        name: name,
        code: code,
        icon: icon,
        isActive: isActive,
      );
}
