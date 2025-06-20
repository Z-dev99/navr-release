// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_api_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthRequest {

 String get email; String get password;
/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRequestCopyWith<AuthRequest> get copyWith => _$AuthRequestCopyWithImpl<AuthRequest>(this as AuthRequest, _$identity);

  /// Serializes this AuthRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthRequest(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthRequestCopyWith<$Res>  {
  factory $AuthRequestCopyWith(AuthRequest value, $Res Function(AuthRequest) _then) = _$AuthRequestCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthRequestCopyWithImpl<$Res>
    implements $AuthRequestCopyWith<$Res> {
  _$AuthRequestCopyWithImpl(this._self, this._then);

  final AuthRequest _self;
  final $Res Function(AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AuthRequest implements AuthRequest {
  const _AuthRequest({required this.email, required this.password});
  factory _AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);

@override final  String email;
@override final  String password;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthRequestCopyWith<_AuthRequest> get copyWith => __$AuthRequestCopyWithImpl<_AuthRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthRequest(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$AuthRequestCopyWith<$Res> implements $AuthRequestCopyWith<$Res> {
  factory _$AuthRequestCopyWith(_AuthRequest value, $Res Function(_AuthRequest) _then) = __$AuthRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$AuthRequestCopyWithImpl<$Res>
    implements _$AuthRequestCopyWith<$Res> {
  __$AuthRequestCopyWithImpl(this._self, this._then);

  final _AuthRequest _self;
  final $Res Function(_AuthRequest) _then;

/// Create a copy of AuthRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_AuthRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthResponse {

 String get message; Tokens get tokens; User get user;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,tokens,user);

@override
String toString() {
  return 'AuthResponse(message: $message, tokens: $tokens, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 String message, Tokens tokens, User user
});


$TokensCopyWith<$Res> get tokens;$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? tokens = null,Object? user = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as Tokens,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokensCopyWith<$Res> get tokens {
  
  return $TokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({required this.message, required this.tokens, required this.user});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  String message;
@override final  Tokens tokens;
@override final  User user;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.tokens, tokens) || other.tokens == tokens)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,tokens,user);

@override
String toString() {
  return 'AuthResponse(message: $message, tokens: $tokens, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, Tokens tokens, User user
});


@override $TokensCopyWith<$Res> get tokens;@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? tokens = null,Object? user = null,}) {
  return _then(_AuthResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,tokens: null == tokens ? _self.tokens : tokens // ignore: cast_nullable_to_non_nullable
as Tokens,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokensCopyWith<$Res> get tokens {
  
  return $TokensCopyWith<$Res>(_self.tokens, (value) {
    return _then(_self.copyWith(tokens: value));
  });
}/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$Tokens {

 String get refresh; String get access;
/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokensCopyWith<Tokens> get copyWith => _$TokensCopyWithImpl<Tokens>(this as Tokens, _$identity);

  /// Serializes this Tokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tokens&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'Tokens(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class $TokensCopyWith<$Res>  {
  factory $TokensCopyWith(Tokens value, $Res Function(Tokens) _then) = _$TokensCopyWithImpl;
@useResult
$Res call({
 String refresh, String access
});




}
/// @nodoc
class _$TokensCopyWithImpl<$Res>
    implements $TokensCopyWith<$Res> {
  _$TokensCopyWithImpl(this._self, this._then);

  final Tokens _self;
  final $Res Function(Tokens) _then;

/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refresh = null,Object? access = null,}) {
  return _then(_self.copyWith(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Tokens implements Tokens {
  const _Tokens({required this.refresh, required this.access});
  factory _Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

@override final  String refresh;
@override final  String access;

/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokensCopyWith<_Tokens> get copyWith => __$TokensCopyWithImpl<_Tokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tokens&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'Tokens(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class _$TokensCopyWith<$Res> implements $TokensCopyWith<$Res> {
  factory _$TokensCopyWith(_Tokens value, $Res Function(_Tokens) _then) = __$TokensCopyWithImpl;
@override @useResult
$Res call({
 String refresh, String access
});




}
/// @nodoc
class __$TokensCopyWithImpl<$Res>
    implements _$TokensCopyWith<$Res> {
  __$TokensCopyWithImpl(this._self, this._then);

  final _Tokens _self;
  final $Res Function(_Tokens) _then;

/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refresh = null,Object? access = null,}) {
  return _then(_Tokens(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$User {

 String get id; String? get phone_number; String get email; String get role; String? get name; String? get surname; String? get patronymic; String? get pinfl; bool get is_active; bool get is_staff; bool get is_verified; String get region;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.patronymic, patronymic) || other.patronymic == patronymic)&&(identical(other.pinfl, pinfl) || other.pinfl == pinfl)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.is_staff, is_staff) || other.is_staff == is_staff)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone_number,email,role,name,surname,patronymic,pinfl,is_active,is_staff,is_verified,region);

@override
String toString() {
  return 'User(id: $id, phone_number: $phone_number, email: $email, role: $role, name: $name, surname: $surname, patronymic: $patronymic, pinfl: $pinfl, is_active: $is_active, is_staff: $is_staff, is_verified: $is_verified, region: $region)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String? phone_number, String email, String role, String? name, String? surname, String? patronymic, String? pinfl, bool is_active, bool is_staff, bool is_verified, String region
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone_number = freezed,Object? email = null,Object? role = null,Object? name = freezed,Object? surname = freezed,Object? patronymic = freezed,Object? pinfl = freezed,Object? is_active = null,Object? is_staff = null,Object? is_verified = null,Object? region = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phone_number: freezed == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,patronymic: freezed == patronymic ? _self.patronymic : patronymic // ignore: cast_nullable_to_non_nullable
as String?,pinfl: freezed == pinfl ? _self.pinfl : pinfl // ignore: cast_nullable_to_non_nullable
as String?,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,is_staff: null == is_staff ? _self.is_staff : is_staff // ignore: cast_nullable_to_non_nullable
as bool,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, this.phone_number, required this.email, required this.role, this.name, this.surname, this.patronymic, this.pinfl, required this.is_active, required this.is_staff, required this.is_verified, required this.region});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String? phone_number;
@override final  String email;
@override final  String role;
@override final  String? name;
@override final  String? surname;
@override final  String? patronymic;
@override final  String? pinfl;
@override final  bool is_active;
@override final  bool is_staff;
@override final  bool is_verified;
@override final  String region;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.patronymic, patronymic) || other.patronymic == patronymic)&&(identical(other.pinfl, pinfl) || other.pinfl == pinfl)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.is_staff, is_staff) || other.is_staff == is_staff)&&(identical(other.is_verified, is_verified) || other.is_verified == is_verified)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone_number,email,role,name,surname,patronymic,pinfl,is_active,is_staff,is_verified,region);

@override
String toString() {
  return 'User(id: $id, phone_number: $phone_number, email: $email, role: $role, name: $name, surname: $surname, patronymic: $patronymic, pinfl: $pinfl, is_active: $is_active, is_staff: $is_staff, is_verified: $is_verified, region: $region)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String? phone_number, String email, String role, String? name, String? surname, String? patronymic, String? pinfl, bool is_active, bool is_staff, bool is_verified, String region
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone_number = freezed,Object? email = null,Object? role = null,Object? name = freezed,Object? surname = freezed,Object? patronymic = freezed,Object? pinfl = freezed,Object? is_active = null,Object? is_staff = null,Object? is_verified = null,Object? region = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phone_number: freezed == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,surname: freezed == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String?,patronymic: freezed == patronymic ? _self.patronymic : patronymic // ignore: cast_nullable_to_non_nullable
as String?,pinfl: freezed == pinfl ? _self.pinfl : pinfl // ignore: cast_nullable_to_non_nullable
as String?,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,is_staff: null == is_staff ? _self.is_staff : is_staff // ignore: cast_nullable_to_non_nullable
as bool,is_verified: null == is_verified ? _self.is_verified : is_verified // ignore: cast_nullable_to_non_nullable
as bool,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
