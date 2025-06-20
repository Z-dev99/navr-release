// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => _AuthRequest(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$AuthRequestToJson(_AuthRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      message: json['message'] as String,
      tokens: Tokens.fromJson(json['tokens'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tokens': instance.tokens,
      'user': instance.user,
    };

_Tokens _$TokensFromJson(Map<String, dynamic> json) => _Tokens(
  refresh: json['refresh'] as String,
  access: json['access'] as String,
);

Map<String, dynamic> _$TokensToJson(_Tokens instance) => <String, dynamic>{
  'refresh': instance.refresh,
  'access': instance.access,
};

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  phone_number: json['phone_number'] as String?,
  email: json['email'] as String,
  role: json['role'] as String,
  name: json['name'] as String?,
  surname: json['surname'] as String?,
  patronymic: json['patronymic'] as String?,
  pinfl: json['pinfl'] as String?,
  is_active: json['is_active'] as bool,
  is_staff: json['is_staff'] as bool,
  is_verified: json['is_verified'] as bool,
  region: json['region'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'phone_number': instance.phone_number,
  'email': instance.email,
  'role': instance.role,
  'name': instance.name,
  'surname': instance.surname,
  'patronymic': instance.patronymic,
  'pinfl': instance.pinfl,
  'is_active': instance.is_active,
  'is_staff': instance.is_staff,
  'is_verified': instance.is_verified,
  'region': instance.region,
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _AuthApiClient implements AuthApiClient {
  _AuthApiClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<AuthResponse> login(AuthRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<AuthResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/login/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AuthResponse _value;
    try {
      _value = AuthResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<AuthResponse> register(AuthRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<AuthResponse>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/register/custom/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late AuthResponse _value;
    try {
      _value = AuthResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
