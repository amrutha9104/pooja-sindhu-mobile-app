import 'package:dio/dio.dart';
import 'package:pooja_sindhu/features/auth/data/models/auth_dtos.dart';

class AuthApi {
  AuthApi(this._dio, {required this.baseUrl});

  final Dio _dio;
  final String baseUrl;

  Future<AuthResponseDto> signInWithGoogle(GoogleSignInRequest request) async {
    final response = await _dio.post<dynamic>(
      '$baseUrl/api/v1/auth/google',
      data: request.toJson(),
    );
    return AuthResponseDto.fromJson(_data(response.data));
  }

  Future<RefreshResponseDto> refreshToken(RefreshRequest request) async {
    final response = await _dio.post<dynamic>(
      '$baseUrl/api/v1/auth/refresh',
      data: request.toJson(),
    );
    return RefreshResponseDto.fromJson(_data(response.data));
  }

  Future<void> logout() async {
    await _dio.post<dynamic>('$baseUrl/api/v1/auth/logout');
  }

  Map<String, dynamic> _data(dynamic responseData) {
    final json = responseData as Map<String, dynamic>;
    return (json['data'] as Map<String, dynamic>);
  }
}
