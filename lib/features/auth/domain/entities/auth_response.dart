import 'package:webrofm/features/auth/domain/entities/user.dart';

class AuthResponse {
  final User user;
  final String token;

  const AuthResponse({required this.user, required this.token});

  AuthResponse copyWith({
    User? user,
    String? token,
  }) {
    return AuthResponse(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'token': token,
      };

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String,
      );
}
