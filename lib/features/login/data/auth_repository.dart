import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:navr_app/features/login/data/auth_api_client.dart';

@injectable
class AuthRepository {
  const AuthRepository({required AuthApiClient apiClient})
    : _apiClient = apiClient;

  final AuthApiClient _apiClient;

  Future<AuthResponse> login({
    required String username,
    required String password,
  }) async {
    final request = AuthRequest(email: username, password: password);

    try {
      final response = await _apiClient.login(request);
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message'] ?? e.message;
      throw Exception('Login failed: $message (code: $statusCode)');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<AuthResponse> register({
    required String username,
    required String password,
  }) async {
    final request = AuthRequest(email: username, password: password);

    try {
      final response = await _apiClient.register(request);
      return response;
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final message = e.response?.data['message'] ?? e.message;
      throw Exception('Login failed: $message (code: $statusCode)');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
