import 'package:pooja_sindhu/features/auth/data/models/user_model.dart';

class GoogleSignInRequest {
  const GoogleSignInRequest({required this.idToken});
  final String idToken;

  Map<String, dynamic> toJson() => {'idToken': idToken};
}

class RefreshRequest {
  const RefreshRequest({required this.refreshToken});
  final String refreshToken;

  Map<String, dynamic> toJson() => {'refreshToken': refreshToken};
}

class AuthResponseDto {
  const AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  final String accessToken;
  final String refreshToken;
  final UserModel user;
}

class RefreshResponseDto {
  const RefreshResponseDto({required this.accessToken});

  factory RefreshResponseDto.fromJson(Map<String, dynamic> json) {
    return RefreshResponseDto(accessToken: json['accessToken'] as String);
  }

  final String accessToken;
}
