// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_api_client.g.dart';
part 'auth_api_client.freezed.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio, {@Named('baseUrl') required String baseUrl}) =
      _AuthApiClient;

  @POST('/login/')
  Future<AuthResponse> login(@Body() AuthRequest request);
  @POST('/register/custom/')
  Future<AuthResponse> register(@Body() AuthRequest request);
}

@freezed
abstract class AuthRequest with _$AuthRequest {
  const factory AuthRequest({required String email, required String password}) =
      _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
}

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String message,
    required Tokens tokens,
    required User user,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
abstract class Tokens with _$Tokens {
  const factory Tokens({required String refresh, required String access}) =
      _Tokens;

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    String? phone_number,
    required String? email,
    required String? role,
    String? name,
    String? surname,
    String? patronymic,
    String? pinfl,
    required bool is_active,
    required bool is_staff,
    required bool is_verified,
    required String? region,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
