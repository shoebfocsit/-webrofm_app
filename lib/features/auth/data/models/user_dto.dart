import 'package:intl/intl.dart';
import 'package:webrofm/core/utils/profile_utils.dart';
import 'package:webrofm/features/auth/domain/entities/user.dart';

class UserDTO {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? avatar;
  final String? gender;
  final String? dateOfBirth;
  final List<String> categories;
  final String createdAt;

  const UserDTO({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    this.gender,
    this.dateOfBirth,
    this.categories = const [],
    required this.createdAt,
  });

  static String? _normalizeAvatar(String? value) {
    final v = value?.trim();
    if (v == null || v.isEmpty) return null;
    return resolveMediaUrl(v);
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
        id: (json['id'] ?? '').toString(),
        name: json['full_name'] as String? ?? json['name'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phone: json['phone_number'] as String? ?? json['phone'] as String? ?? '',
        avatar: _normalizeAvatar(json['profile_picture'] as String? ?? json['avatar'] as String?),
        gender: json['gender'] as String?,
        dateOfBirth: json['date_of_birth'] as String?,
        categories: (json['interests'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            (json['categories'] as List<dynamic>?)
                    ?.map((e) => e as String)
                    .toList() ??
            [],
        createdAt: json['date_joined'] as String? ??
            json['created_at'] as String? ??
            DateTime.now().toIso8601String(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': name,
        'email': email,
        'phone_number': phone,
        'profile_picture': avatar,
        'gender': gender,
        'date_of_birth': dateOfBirth,
        'interests': categories.map((e) => int.tryParse(e) ?? 0).toList(),
        'date_joined': createdAt,
      };

  User toDomain() => User(
        id: id,
        name: name,
        email: email,
        phone: phone,
        avatar: avatar,
        gender: gender,
        dateOfBirth:
            dateOfBirth != null ? DateTime.parse(dateOfBirth!) : null,
        categories: categories,
        createdAt: DateTime.parse(createdAt),
      );

  factory UserDTO.fromDomain(User user) => UserDTO(
        id: user.id,
        name: user.name,
        email: user.email,
        phone: user.phone,
        avatar: user.avatar,
        gender: user.gender,
        dateOfBirth: user.dateOfBirth != null ? DateFormat('yyyy-MM-dd').format(user.dateOfBirth!) : null,
        categories: user.categories,
        createdAt: user.createdAt.toIso8601String(),
      );
}
