import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:navr_app/features/login/data/auth_api_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AuthService extends ChangeNotifier
    implements ValueListenable<AuthResponse?> {
  AuthService(this._apiClient);

  final AuthApiClient _apiClient;

  AuthResponse? _authResponse;

  @override
  AuthResponse? get value => _authResponse;

  bool get isAuthenticated => _authResponse != null;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final request = AuthRequest(email: username, password: password);
      final response = await _apiClient.login(request);

      _authResponse = response;
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('access_token', _authResponse?.tokens.access ?? '');
      _prefs.setString('user', json.encode(response.user));
      notifyListeners();
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final serverMessage = e.response?.data.toString();

      throw Exception(
        serverMessage ?? 'Ошибка входа. Код: $statusCode. Попробуйте позже.',
      );
    } catch (e) {
      throw Exception('Непредвиденная ошибка. Попробуйте позже.');
    }
  }

  Future<void> register({
    required String username,
    required String password,
  }) async {
    try {
      final request = AuthRequest(email: username, password: password);
      final response = await _apiClient.register(request);

      _authResponse = response;
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('access_token', _authResponse?.tokens.access ?? '');
      print(response.user.email);
      _prefs.setString('user', json.encode(response.user));
      notifyListeners();
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final serverMessage = e.response?.data.toString();

      throw Exception(
        serverMessage ?? 'Ошибка входа. Код: $statusCode. Попробуйте позже.',
      );
    } catch (e) {
      throw Exception('Непредвиденная ошибка. ${e} Попробуйте позже.');
    }
  }

  void logout() {
    _authResponse = null;
    notifyListeners();
  }
}
