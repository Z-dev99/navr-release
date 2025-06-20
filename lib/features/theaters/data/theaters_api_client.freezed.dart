// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theaters_api_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TheatersResponse {

 int get count; String? get next; String? get previous; List<Theaters> get results;
/// Create a copy of TheatersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheatersResponseCopyWith<TheatersResponse> get copyWith => _$TheatersResponseCopyWithImpl<TheatersResponse>(this as TheatersResponse, _$identity);

  /// Serializes this TheatersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheatersResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'TheatersResponse(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $TheatersResponseCopyWith<$Res>  {
  factory $TheatersResponseCopyWith(TheatersResponse value, $Res Function(TheatersResponse) _then) = _$TheatersResponseCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<Theaters> results
});




}
/// @nodoc
class _$TheatersResponseCopyWithImpl<$Res>
    implements $TheatersResponseCopyWith<$Res> {
  _$TheatersResponseCopyWithImpl(this._self, this._then);

  final TheatersResponse _self;
  final $Res Function(TheatersResponse) _then;

/// Create a copy of TheatersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Theaters>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TheatersResponse implements TheatersResponse {
  const _TheatersResponse({required this.count, this.next = '', this.previous = '', final  List<Theaters> results = const <Theaters>[]}): _results = results;
  factory _TheatersResponse.fromJson(Map<String, dynamic> json) => _$TheatersResponseFromJson(json);

@override final  int count;
@override@JsonKey() final  String? next;
@override@JsonKey() final  String? previous;
 final  List<Theaters> _results;
@override@JsonKey() List<Theaters> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of TheatersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheatersResponseCopyWith<_TheatersResponse> get copyWith => __$TheatersResponseCopyWithImpl<_TheatersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TheatersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheatersResponse&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'TheatersResponse(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$TheatersResponseCopyWith<$Res> implements $TheatersResponseCopyWith<$Res> {
  factory _$TheatersResponseCopyWith(_TheatersResponse value, $Res Function(_TheatersResponse) _then) = __$TheatersResponseCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<Theaters> results
});




}
/// @nodoc
class __$TheatersResponseCopyWithImpl<$Res>
    implements _$TheatersResponseCopyWith<$Res> {
  __$TheatersResponseCopyWithImpl(this._self, this._then);

  final _TheatersResponse _self;
  final $Res Function(_TheatersResponse) _then;

/// Create a copy of TheatersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_TheatersResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Theaters>,
  ));
}


}


/// @nodoc
mixin _$Theaters {

 int? get id; String? get pictureAvatar; String? get pictureBuklet; String? get pictureBanner; int? get palace; int? get palaceHall; String? get palace_name_uz; String? get palace_name_ru; String? get palace_address_uz; String? get palace_address_ru; String? get category_name; String? get longitude; String? get latitude; List<dynamic>? get session; String? get created_at; String? get updated_at; int? get eventId; int? get eventTypeId; String? get eventTypeName; String? get eventTypeName_en; String? get eventTypeName_uz; String? get eventTypeName_qr; String? get eventTypeName_ru; int? get organizatorId; String? get name; String? get name_en; String? get name_uz; String? get name_qr; String? get name_ru; String? get shortName; String? get shortName_en; String? get shortName_uz; String? get shortName_qr; String? get shortName_ru; String? get content; String? get content_en; String? get content_uz; String? get content_qr; String? get content_ru; String? get beginDate; String? get endDate;@JsonKey(defaultValue: 0) int? get ageLimited; String? get ageLimitName; String? get ageLimitName_en; String? get ageLimitName_uz; String? get ageLimitName_qr; String? get ageLimitName_ru;@JsonKey(defaultValue: false) bool? get isRejectTicket; bool? get isVerificationUser; bool? get isEvenPrivileges;@JsonKey(defaultValue: 0) int? get minPrice;@JsonKey(defaultValue: 0) int? get maxPrice; String? get date; String? get currency; bool? get isWithoutSeats; String? get videoClip;@JsonKey(defaultValue: 0) int? get privilegesRound; int? get invitationCount; bool? get isUseDiscountToPrivileges; int? get category; List<dynamic>? get actors;
/// Create a copy of Theaters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheatersCopyWith<Theaters> get copyWith => _$TheatersCopyWithImpl<Theaters>(this as Theaters, _$identity);

  /// Serializes this Theaters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Theaters&&(identical(other.id, id) || other.id == id)&&(identical(other.pictureAvatar, pictureAvatar) || other.pictureAvatar == pictureAvatar)&&(identical(other.pictureBuklet, pictureBuklet) || other.pictureBuklet == pictureBuklet)&&(identical(other.pictureBanner, pictureBanner) || other.pictureBanner == pictureBanner)&&(identical(other.palace, palace) || other.palace == palace)&&(identical(other.palaceHall, palaceHall) || other.palaceHall == palaceHall)&&(identical(other.palace_name_uz, palace_name_uz) || other.palace_name_uz == palace_name_uz)&&(identical(other.palace_name_ru, palace_name_ru) || other.palace_name_ru == palace_name_ru)&&(identical(other.palace_address_uz, palace_address_uz) || other.palace_address_uz == palace_address_uz)&&(identical(other.palace_address_ru, palace_address_ru) || other.palace_address_ru == palace_address_ru)&&(identical(other.category_name, category_name) || other.category_name == category_name)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&const DeepCollectionEquality().equals(other.session, session)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.eventTypeId, eventTypeId) || other.eventTypeId == eventTypeId)&&(identical(other.eventTypeName, eventTypeName) || other.eventTypeName == eventTypeName)&&(identical(other.eventTypeName_en, eventTypeName_en) || other.eventTypeName_en == eventTypeName_en)&&(identical(other.eventTypeName_uz, eventTypeName_uz) || other.eventTypeName_uz == eventTypeName_uz)&&(identical(other.eventTypeName_qr, eventTypeName_qr) || other.eventTypeName_qr == eventTypeName_qr)&&(identical(other.eventTypeName_ru, eventTypeName_ru) || other.eventTypeName_ru == eventTypeName_ru)&&(identical(other.organizatorId, organizatorId) || other.organizatorId == organizatorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_uz, name_uz) || other.name_uz == name_uz)&&(identical(other.name_qr, name_qr) || other.name_qr == name_qr)&&(identical(other.name_ru, name_ru) || other.name_ru == name_ru)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.shortName_en, shortName_en) || other.shortName_en == shortName_en)&&(identical(other.shortName_uz, shortName_uz) || other.shortName_uz == shortName_uz)&&(identical(other.shortName_qr, shortName_qr) || other.shortName_qr == shortName_qr)&&(identical(other.shortName_ru, shortName_ru) || other.shortName_ru == shortName_ru)&&(identical(other.content, content) || other.content == content)&&(identical(other.content_en, content_en) || other.content_en == content_en)&&(identical(other.content_uz, content_uz) || other.content_uz == content_uz)&&(identical(other.content_qr, content_qr) || other.content_qr == content_qr)&&(identical(other.content_ru, content_ru) || other.content_ru == content_ru)&&(identical(other.beginDate, beginDate) || other.beginDate == beginDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.ageLimited, ageLimited) || other.ageLimited == ageLimited)&&(identical(other.ageLimitName, ageLimitName) || other.ageLimitName == ageLimitName)&&(identical(other.ageLimitName_en, ageLimitName_en) || other.ageLimitName_en == ageLimitName_en)&&(identical(other.ageLimitName_uz, ageLimitName_uz) || other.ageLimitName_uz == ageLimitName_uz)&&(identical(other.ageLimitName_qr, ageLimitName_qr) || other.ageLimitName_qr == ageLimitName_qr)&&(identical(other.ageLimitName_ru, ageLimitName_ru) || other.ageLimitName_ru == ageLimitName_ru)&&(identical(other.isRejectTicket, isRejectTicket) || other.isRejectTicket == isRejectTicket)&&(identical(other.isVerificationUser, isVerificationUser) || other.isVerificationUser == isVerificationUser)&&(identical(other.isEvenPrivileges, isEvenPrivileges) || other.isEvenPrivileges == isEvenPrivileges)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.date, date) || other.date == date)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isWithoutSeats, isWithoutSeats) || other.isWithoutSeats == isWithoutSeats)&&(identical(other.videoClip, videoClip) || other.videoClip == videoClip)&&(identical(other.privilegesRound, privilegesRound) || other.privilegesRound == privilegesRound)&&(identical(other.invitationCount, invitationCount) || other.invitationCount == invitationCount)&&(identical(other.isUseDiscountToPrivileges, isUseDiscountToPrivileges) || other.isUseDiscountToPrivileges == isUseDiscountToPrivileges)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.actors, actors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,pictureAvatar,pictureBuklet,pictureBanner,palace,palaceHall,palace_name_uz,palace_name_ru,palace_address_uz,palace_address_ru,category_name,longitude,latitude,const DeepCollectionEquality().hash(session),created_at,updated_at,eventId,eventTypeId,eventTypeName,eventTypeName_en,eventTypeName_uz,eventTypeName_qr,eventTypeName_ru,organizatorId,name,name_en,name_uz,name_qr,name_ru,shortName,shortName_en,shortName_uz,shortName_qr,shortName_ru,content,content_en,content_uz,content_qr,content_ru,beginDate,endDate,ageLimited,ageLimitName,ageLimitName_en,ageLimitName_uz,ageLimitName_qr,ageLimitName_ru,isRejectTicket,isVerificationUser,isEvenPrivileges,minPrice,maxPrice,date,currency,isWithoutSeats,videoClip,privilegesRound,invitationCount,isUseDiscountToPrivileges,category,const DeepCollectionEquality().hash(actors)]);

@override
String toString() {
  return 'Theaters(id: $id, pictureAvatar: $pictureAvatar, pictureBuklet: $pictureBuklet, pictureBanner: $pictureBanner, palace: $palace, palaceHall: $palaceHall, palace_name_uz: $palace_name_uz, palace_name_ru: $palace_name_ru, palace_address_uz: $palace_address_uz, palace_address_ru: $palace_address_ru, category_name: $category_name, longitude: $longitude, latitude: $latitude, session: $session, created_at: $created_at, updated_at: $updated_at, eventId: $eventId, eventTypeId: $eventTypeId, eventTypeName: $eventTypeName, eventTypeName_en: $eventTypeName_en, eventTypeName_uz: $eventTypeName_uz, eventTypeName_qr: $eventTypeName_qr, eventTypeName_ru: $eventTypeName_ru, organizatorId: $organizatorId, name: $name, name_en: $name_en, name_uz: $name_uz, name_qr: $name_qr, name_ru: $name_ru, shortName: $shortName, shortName_en: $shortName_en, shortName_uz: $shortName_uz, shortName_qr: $shortName_qr, shortName_ru: $shortName_ru, content: $content, content_en: $content_en, content_uz: $content_uz, content_qr: $content_qr, content_ru: $content_ru, beginDate: $beginDate, endDate: $endDate, ageLimited: $ageLimited, ageLimitName: $ageLimitName, ageLimitName_en: $ageLimitName_en, ageLimitName_uz: $ageLimitName_uz, ageLimitName_qr: $ageLimitName_qr, ageLimitName_ru: $ageLimitName_ru, isRejectTicket: $isRejectTicket, isVerificationUser: $isVerificationUser, isEvenPrivileges: $isEvenPrivileges, minPrice: $minPrice, maxPrice: $maxPrice, date: $date, currency: $currency, isWithoutSeats: $isWithoutSeats, videoClip: $videoClip, privilegesRound: $privilegesRound, invitationCount: $invitationCount, isUseDiscountToPrivileges: $isUseDiscountToPrivileges, category: $category, actors: $actors)';
}


}

/// @nodoc
abstract mixin class $TheatersCopyWith<$Res>  {
  factory $TheatersCopyWith(Theaters value, $Res Function(Theaters) _then) = _$TheatersCopyWithImpl;
@useResult
$Res call({
 int? id, String? pictureAvatar, String? pictureBuklet, String? pictureBanner, int? palace, int? palaceHall, String? palace_name_uz, String? palace_name_ru, String? palace_address_uz, String? palace_address_ru, String? category_name, String? longitude, String? latitude, List<dynamic>? session, String? created_at, String? updated_at, int? eventId, int? eventTypeId, String? eventTypeName, String? eventTypeName_en, String? eventTypeName_uz, String? eventTypeName_qr, String? eventTypeName_ru, int? organizatorId, String? name, String? name_en, String? name_uz, String? name_qr, String? name_ru, String? shortName, String? shortName_en, String? shortName_uz, String? shortName_qr, String? shortName_ru, String? content, String? content_en, String? content_uz, String? content_qr, String? content_ru, String? beginDate, String? endDate,@JsonKey(defaultValue: 0) int? ageLimited, String? ageLimitName, String? ageLimitName_en, String? ageLimitName_uz, String? ageLimitName_qr, String? ageLimitName_ru,@JsonKey(defaultValue: false) bool? isRejectTicket, bool? isVerificationUser, bool? isEvenPrivileges,@JsonKey(defaultValue: 0) int? minPrice,@JsonKey(defaultValue: 0) int? maxPrice, String? date, String? currency, bool? isWithoutSeats, String? videoClip,@JsonKey(defaultValue: 0) int? privilegesRound, int? invitationCount, bool? isUseDiscountToPrivileges, int? category, List<dynamic>? actors
});




}
/// @nodoc
class _$TheatersCopyWithImpl<$Res>
    implements $TheatersCopyWith<$Res> {
  _$TheatersCopyWithImpl(this._self, this._then);

  final Theaters _self;
  final $Res Function(Theaters) _then;

/// Create a copy of Theaters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? pictureAvatar = freezed,Object? pictureBuklet = freezed,Object? pictureBanner = freezed,Object? palace = freezed,Object? palaceHall = freezed,Object? palace_name_uz = freezed,Object? palace_name_ru = freezed,Object? palace_address_uz = freezed,Object? palace_address_ru = freezed,Object? category_name = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? session = freezed,Object? created_at = freezed,Object? updated_at = freezed,Object? eventId = freezed,Object? eventTypeId = freezed,Object? eventTypeName = freezed,Object? eventTypeName_en = freezed,Object? eventTypeName_uz = freezed,Object? eventTypeName_qr = freezed,Object? eventTypeName_ru = freezed,Object? organizatorId = freezed,Object? name = freezed,Object? name_en = freezed,Object? name_uz = freezed,Object? name_qr = freezed,Object? name_ru = freezed,Object? shortName = freezed,Object? shortName_en = freezed,Object? shortName_uz = freezed,Object? shortName_qr = freezed,Object? shortName_ru = freezed,Object? content = freezed,Object? content_en = freezed,Object? content_uz = freezed,Object? content_qr = freezed,Object? content_ru = freezed,Object? beginDate = freezed,Object? endDate = freezed,Object? ageLimited = freezed,Object? ageLimitName = freezed,Object? ageLimitName_en = freezed,Object? ageLimitName_uz = freezed,Object? ageLimitName_qr = freezed,Object? ageLimitName_ru = freezed,Object? isRejectTicket = freezed,Object? isVerificationUser = freezed,Object? isEvenPrivileges = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? date = freezed,Object? currency = freezed,Object? isWithoutSeats = freezed,Object? videoClip = freezed,Object? privilegesRound = freezed,Object? invitationCount = freezed,Object? isUseDiscountToPrivileges = freezed,Object? category = freezed,Object? actors = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,pictureAvatar: freezed == pictureAvatar ? _self.pictureAvatar : pictureAvatar // ignore: cast_nullable_to_non_nullable
as String?,pictureBuklet: freezed == pictureBuklet ? _self.pictureBuklet : pictureBuklet // ignore: cast_nullable_to_non_nullable
as String?,pictureBanner: freezed == pictureBanner ? _self.pictureBanner : pictureBanner // ignore: cast_nullable_to_non_nullable
as String?,palace: freezed == palace ? _self.palace : palace // ignore: cast_nullable_to_non_nullable
as int?,palaceHall: freezed == palaceHall ? _self.palaceHall : palaceHall // ignore: cast_nullable_to_non_nullable
as int?,palace_name_uz: freezed == palace_name_uz ? _self.palace_name_uz : palace_name_uz // ignore: cast_nullable_to_non_nullable
as String?,palace_name_ru: freezed == palace_name_ru ? _self.palace_name_ru : palace_name_ru // ignore: cast_nullable_to_non_nullable
as String?,palace_address_uz: freezed == palace_address_uz ? _self.palace_address_uz : palace_address_uz // ignore: cast_nullable_to_non_nullable
as String?,palace_address_ru: freezed == palace_address_ru ? _self.palace_address_ru : palace_address_ru // ignore: cast_nullable_to_non_nullable
as String?,category_name: freezed == category_name ? _self.category_name : category_name // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,eventTypeId: freezed == eventTypeId ? _self.eventTypeId : eventTypeId // ignore: cast_nullable_to_non_nullable
as int?,eventTypeName: freezed == eventTypeName ? _self.eventTypeName : eventTypeName // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_en: freezed == eventTypeName_en ? _self.eventTypeName_en : eventTypeName_en // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_uz: freezed == eventTypeName_uz ? _self.eventTypeName_uz : eventTypeName_uz // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_qr: freezed == eventTypeName_qr ? _self.eventTypeName_qr : eventTypeName_qr // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_ru: freezed == eventTypeName_ru ? _self.eventTypeName_ru : eventTypeName_ru // ignore: cast_nullable_to_non_nullable
as String?,organizatorId: freezed == organizatorId ? _self.organizatorId : organizatorId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,name_en: freezed == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String?,name_uz: freezed == name_uz ? _self.name_uz : name_uz // ignore: cast_nullable_to_non_nullable
as String?,name_qr: freezed == name_qr ? _self.name_qr : name_qr // ignore: cast_nullable_to_non_nullable
as String?,name_ru: freezed == name_ru ? _self.name_ru : name_ru // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,shortName_en: freezed == shortName_en ? _self.shortName_en : shortName_en // ignore: cast_nullable_to_non_nullable
as String?,shortName_uz: freezed == shortName_uz ? _self.shortName_uz : shortName_uz // ignore: cast_nullable_to_non_nullable
as String?,shortName_qr: freezed == shortName_qr ? _self.shortName_qr : shortName_qr // ignore: cast_nullable_to_non_nullable
as String?,shortName_ru: freezed == shortName_ru ? _self.shortName_ru : shortName_ru // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,content_en: freezed == content_en ? _self.content_en : content_en // ignore: cast_nullable_to_non_nullable
as String?,content_uz: freezed == content_uz ? _self.content_uz : content_uz // ignore: cast_nullable_to_non_nullable
as String?,content_qr: freezed == content_qr ? _self.content_qr : content_qr // ignore: cast_nullable_to_non_nullable
as String?,content_ru: freezed == content_ru ? _self.content_ru : content_ru // ignore: cast_nullable_to_non_nullable
as String?,beginDate: freezed == beginDate ? _self.beginDate : beginDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,ageLimited: freezed == ageLimited ? _self.ageLimited : ageLimited // ignore: cast_nullable_to_non_nullable
as int?,ageLimitName: freezed == ageLimitName ? _self.ageLimitName : ageLimitName // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_en: freezed == ageLimitName_en ? _self.ageLimitName_en : ageLimitName_en // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_uz: freezed == ageLimitName_uz ? _self.ageLimitName_uz : ageLimitName_uz // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_qr: freezed == ageLimitName_qr ? _self.ageLimitName_qr : ageLimitName_qr // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_ru: freezed == ageLimitName_ru ? _self.ageLimitName_ru : ageLimitName_ru // ignore: cast_nullable_to_non_nullable
as String?,isRejectTicket: freezed == isRejectTicket ? _self.isRejectTicket : isRejectTicket // ignore: cast_nullable_to_non_nullable
as bool?,isVerificationUser: freezed == isVerificationUser ? _self.isVerificationUser : isVerificationUser // ignore: cast_nullable_to_non_nullable
as bool?,isEvenPrivileges: freezed == isEvenPrivileges ? _self.isEvenPrivileges : isEvenPrivileges // ignore: cast_nullable_to_non_nullable
as bool?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,isWithoutSeats: freezed == isWithoutSeats ? _self.isWithoutSeats : isWithoutSeats // ignore: cast_nullable_to_non_nullable
as bool?,videoClip: freezed == videoClip ? _self.videoClip : videoClip // ignore: cast_nullable_to_non_nullable
as String?,privilegesRound: freezed == privilegesRound ? _self.privilegesRound : privilegesRound // ignore: cast_nullable_to_non_nullable
as int?,invitationCount: freezed == invitationCount ? _self.invitationCount : invitationCount // ignore: cast_nullable_to_non_nullable
as int?,isUseDiscountToPrivileges: freezed == isUseDiscountToPrivileges ? _self.isUseDiscountToPrivileges : isUseDiscountToPrivileges // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int?,actors: freezed == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Theaters implements Theaters {
  const _Theaters({this.id, this.pictureAvatar, this.pictureBuklet, this.pictureBanner, this.palace, this.palaceHall, this.palace_name_uz, this.palace_name_ru, this.palace_address_uz, this.palace_address_ru, this.category_name, this.longitude, this.latitude, final  List<dynamic>? session, this.created_at, this.updated_at, this.eventId, this.eventTypeId, this.eventTypeName, this.eventTypeName_en, this.eventTypeName_uz, this.eventTypeName_qr, this.eventTypeName_ru, this.organizatorId, this.name, this.name_en, this.name_uz, this.name_qr, this.name_ru, this.shortName, this.shortName_en, this.shortName_uz, this.shortName_qr, this.shortName_ru, this.content, this.content_en, this.content_uz, this.content_qr, this.content_ru, this.beginDate, this.endDate, @JsonKey(defaultValue: 0) this.ageLimited, this.ageLimitName, this.ageLimitName_en, this.ageLimitName_uz, this.ageLimitName_qr, this.ageLimitName_ru, @JsonKey(defaultValue: false) this.isRejectTicket, this.isVerificationUser, this.isEvenPrivileges, @JsonKey(defaultValue: 0) this.minPrice, @JsonKey(defaultValue: 0) this.maxPrice, this.date, this.currency, this.isWithoutSeats, this.videoClip, @JsonKey(defaultValue: 0) this.privilegesRound, this.invitationCount, this.isUseDiscountToPrivileges, this.category, final  List<dynamic>? actors}): _session = session,_actors = actors;
  factory _Theaters.fromJson(Map<String, dynamic> json) => _$TheatersFromJson(json);

@override final  int? id;
@override final  String? pictureAvatar;
@override final  String? pictureBuklet;
@override final  String? pictureBanner;
@override final  int? palace;
@override final  int? palaceHall;
@override final  String? palace_name_uz;
@override final  String? palace_name_ru;
@override final  String? palace_address_uz;
@override final  String? palace_address_ru;
@override final  String? category_name;
@override final  String? longitude;
@override final  String? latitude;
 final  List<dynamic>? _session;
@override List<dynamic>? get session {
  final value = _session;
  if (value == null) return null;
  if (_session is EqualUnmodifiableListView) return _session;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? created_at;
@override final  String? updated_at;
@override final  int? eventId;
@override final  int? eventTypeId;
@override final  String? eventTypeName;
@override final  String? eventTypeName_en;
@override final  String? eventTypeName_uz;
@override final  String? eventTypeName_qr;
@override final  String? eventTypeName_ru;
@override final  int? organizatorId;
@override final  String? name;
@override final  String? name_en;
@override final  String? name_uz;
@override final  String? name_qr;
@override final  String? name_ru;
@override final  String? shortName;
@override final  String? shortName_en;
@override final  String? shortName_uz;
@override final  String? shortName_qr;
@override final  String? shortName_ru;
@override final  String? content;
@override final  String? content_en;
@override final  String? content_uz;
@override final  String? content_qr;
@override final  String? content_ru;
@override final  String? beginDate;
@override final  String? endDate;
@override@JsonKey(defaultValue: 0) final  int? ageLimited;
@override final  String? ageLimitName;
@override final  String? ageLimitName_en;
@override final  String? ageLimitName_uz;
@override final  String? ageLimitName_qr;
@override final  String? ageLimitName_ru;
@override@JsonKey(defaultValue: false) final  bool? isRejectTicket;
@override final  bool? isVerificationUser;
@override final  bool? isEvenPrivileges;
@override@JsonKey(defaultValue: 0) final  int? minPrice;
@override@JsonKey(defaultValue: 0) final  int? maxPrice;
@override final  String? date;
@override final  String? currency;
@override final  bool? isWithoutSeats;
@override final  String? videoClip;
@override@JsonKey(defaultValue: 0) final  int? privilegesRound;
@override final  int? invitationCount;
@override final  bool? isUseDiscountToPrivileges;
@override final  int? category;
 final  List<dynamic>? _actors;
@override List<dynamic>? get actors {
  final value = _actors;
  if (value == null) return null;
  if (_actors is EqualUnmodifiableListView) return _actors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Theaters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheatersCopyWith<_Theaters> get copyWith => __$TheatersCopyWithImpl<_Theaters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TheatersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Theaters&&(identical(other.id, id) || other.id == id)&&(identical(other.pictureAvatar, pictureAvatar) || other.pictureAvatar == pictureAvatar)&&(identical(other.pictureBuklet, pictureBuklet) || other.pictureBuklet == pictureBuklet)&&(identical(other.pictureBanner, pictureBanner) || other.pictureBanner == pictureBanner)&&(identical(other.palace, palace) || other.palace == palace)&&(identical(other.palaceHall, palaceHall) || other.palaceHall == palaceHall)&&(identical(other.palace_name_uz, palace_name_uz) || other.palace_name_uz == palace_name_uz)&&(identical(other.palace_name_ru, palace_name_ru) || other.palace_name_ru == palace_name_ru)&&(identical(other.palace_address_uz, palace_address_uz) || other.palace_address_uz == palace_address_uz)&&(identical(other.palace_address_ru, palace_address_ru) || other.palace_address_ru == palace_address_ru)&&(identical(other.category_name, category_name) || other.category_name == category_name)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&const DeepCollectionEquality().equals(other._session, _session)&&(identical(other.created_at, created_at) || other.created_at == created_at)&&(identical(other.updated_at, updated_at) || other.updated_at == updated_at)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.eventTypeId, eventTypeId) || other.eventTypeId == eventTypeId)&&(identical(other.eventTypeName, eventTypeName) || other.eventTypeName == eventTypeName)&&(identical(other.eventTypeName_en, eventTypeName_en) || other.eventTypeName_en == eventTypeName_en)&&(identical(other.eventTypeName_uz, eventTypeName_uz) || other.eventTypeName_uz == eventTypeName_uz)&&(identical(other.eventTypeName_qr, eventTypeName_qr) || other.eventTypeName_qr == eventTypeName_qr)&&(identical(other.eventTypeName_ru, eventTypeName_ru) || other.eventTypeName_ru == eventTypeName_ru)&&(identical(other.organizatorId, organizatorId) || other.organizatorId == organizatorId)&&(identical(other.name, name) || other.name == name)&&(identical(other.name_en, name_en) || other.name_en == name_en)&&(identical(other.name_uz, name_uz) || other.name_uz == name_uz)&&(identical(other.name_qr, name_qr) || other.name_qr == name_qr)&&(identical(other.name_ru, name_ru) || other.name_ru == name_ru)&&(identical(other.shortName, shortName) || other.shortName == shortName)&&(identical(other.shortName_en, shortName_en) || other.shortName_en == shortName_en)&&(identical(other.shortName_uz, shortName_uz) || other.shortName_uz == shortName_uz)&&(identical(other.shortName_qr, shortName_qr) || other.shortName_qr == shortName_qr)&&(identical(other.shortName_ru, shortName_ru) || other.shortName_ru == shortName_ru)&&(identical(other.content, content) || other.content == content)&&(identical(other.content_en, content_en) || other.content_en == content_en)&&(identical(other.content_uz, content_uz) || other.content_uz == content_uz)&&(identical(other.content_qr, content_qr) || other.content_qr == content_qr)&&(identical(other.content_ru, content_ru) || other.content_ru == content_ru)&&(identical(other.beginDate, beginDate) || other.beginDate == beginDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.ageLimited, ageLimited) || other.ageLimited == ageLimited)&&(identical(other.ageLimitName, ageLimitName) || other.ageLimitName == ageLimitName)&&(identical(other.ageLimitName_en, ageLimitName_en) || other.ageLimitName_en == ageLimitName_en)&&(identical(other.ageLimitName_uz, ageLimitName_uz) || other.ageLimitName_uz == ageLimitName_uz)&&(identical(other.ageLimitName_qr, ageLimitName_qr) || other.ageLimitName_qr == ageLimitName_qr)&&(identical(other.ageLimitName_ru, ageLimitName_ru) || other.ageLimitName_ru == ageLimitName_ru)&&(identical(other.isRejectTicket, isRejectTicket) || other.isRejectTicket == isRejectTicket)&&(identical(other.isVerificationUser, isVerificationUser) || other.isVerificationUser == isVerificationUser)&&(identical(other.isEvenPrivileges, isEvenPrivileges) || other.isEvenPrivileges == isEvenPrivileges)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.date, date) || other.date == date)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.isWithoutSeats, isWithoutSeats) || other.isWithoutSeats == isWithoutSeats)&&(identical(other.videoClip, videoClip) || other.videoClip == videoClip)&&(identical(other.privilegesRound, privilegesRound) || other.privilegesRound == privilegesRound)&&(identical(other.invitationCount, invitationCount) || other.invitationCount == invitationCount)&&(identical(other.isUseDiscountToPrivileges, isUseDiscountToPrivileges) || other.isUseDiscountToPrivileges == isUseDiscountToPrivileges)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._actors, _actors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,pictureAvatar,pictureBuklet,pictureBanner,palace,palaceHall,palace_name_uz,palace_name_ru,palace_address_uz,palace_address_ru,category_name,longitude,latitude,const DeepCollectionEquality().hash(_session),created_at,updated_at,eventId,eventTypeId,eventTypeName,eventTypeName_en,eventTypeName_uz,eventTypeName_qr,eventTypeName_ru,organizatorId,name,name_en,name_uz,name_qr,name_ru,shortName,shortName_en,shortName_uz,shortName_qr,shortName_ru,content,content_en,content_uz,content_qr,content_ru,beginDate,endDate,ageLimited,ageLimitName,ageLimitName_en,ageLimitName_uz,ageLimitName_qr,ageLimitName_ru,isRejectTicket,isVerificationUser,isEvenPrivileges,minPrice,maxPrice,date,currency,isWithoutSeats,videoClip,privilegesRound,invitationCount,isUseDiscountToPrivileges,category,const DeepCollectionEquality().hash(_actors)]);

@override
String toString() {
  return 'Theaters(id: $id, pictureAvatar: $pictureAvatar, pictureBuklet: $pictureBuklet, pictureBanner: $pictureBanner, palace: $palace, palaceHall: $palaceHall, palace_name_uz: $palace_name_uz, palace_name_ru: $palace_name_ru, palace_address_uz: $palace_address_uz, palace_address_ru: $palace_address_ru, category_name: $category_name, longitude: $longitude, latitude: $latitude, session: $session, created_at: $created_at, updated_at: $updated_at, eventId: $eventId, eventTypeId: $eventTypeId, eventTypeName: $eventTypeName, eventTypeName_en: $eventTypeName_en, eventTypeName_uz: $eventTypeName_uz, eventTypeName_qr: $eventTypeName_qr, eventTypeName_ru: $eventTypeName_ru, organizatorId: $organizatorId, name: $name, name_en: $name_en, name_uz: $name_uz, name_qr: $name_qr, name_ru: $name_ru, shortName: $shortName, shortName_en: $shortName_en, shortName_uz: $shortName_uz, shortName_qr: $shortName_qr, shortName_ru: $shortName_ru, content: $content, content_en: $content_en, content_uz: $content_uz, content_qr: $content_qr, content_ru: $content_ru, beginDate: $beginDate, endDate: $endDate, ageLimited: $ageLimited, ageLimitName: $ageLimitName, ageLimitName_en: $ageLimitName_en, ageLimitName_uz: $ageLimitName_uz, ageLimitName_qr: $ageLimitName_qr, ageLimitName_ru: $ageLimitName_ru, isRejectTicket: $isRejectTicket, isVerificationUser: $isVerificationUser, isEvenPrivileges: $isEvenPrivileges, minPrice: $minPrice, maxPrice: $maxPrice, date: $date, currency: $currency, isWithoutSeats: $isWithoutSeats, videoClip: $videoClip, privilegesRound: $privilegesRound, invitationCount: $invitationCount, isUseDiscountToPrivileges: $isUseDiscountToPrivileges, category: $category, actors: $actors)';
}


}

/// @nodoc
abstract mixin class _$TheatersCopyWith<$Res> implements $TheatersCopyWith<$Res> {
  factory _$TheatersCopyWith(_Theaters value, $Res Function(_Theaters) _then) = __$TheatersCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? pictureAvatar, String? pictureBuklet, String? pictureBanner, int? palace, int? palaceHall, String? palace_name_uz, String? palace_name_ru, String? palace_address_uz, String? palace_address_ru, String? category_name, String? longitude, String? latitude, List<dynamic>? session, String? created_at, String? updated_at, int? eventId, int? eventTypeId, String? eventTypeName, String? eventTypeName_en, String? eventTypeName_uz, String? eventTypeName_qr, String? eventTypeName_ru, int? organizatorId, String? name, String? name_en, String? name_uz, String? name_qr, String? name_ru, String? shortName, String? shortName_en, String? shortName_uz, String? shortName_qr, String? shortName_ru, String? content, String? content_en, String? content_uz, String? content_qr, String? content_ru, String? beginDate, String? endDate,@JsonKey(defaultValue: 0) int? ageLimited, String? ageLimitName, String? ageLimitName_en, String? ageLimitName_uz, String? ageLimitName_qr, String? ageLimitName_ru,@JsonKey(defaultValue: false) bool? isRejectTicket, bool? isVerificationUser, bool? isEvenPrivileges,@JsonKey(defaultValue: 0) int? minPrice,@JsonKey(defaultValue: 0) int? maxPrice, String? date, String? currency, bool? isWithoutSeats, String? videoClip,@JsonKey(defaultValue: 0) int? privilegesRound, int? invitationCount, bool? isUseDiscountToPrivileges, int? category, List<dynamic>? actors
});




}
/// @nodoc
class __$TheatersCopyWithImpl<$Res>
    implements _$TheatersCopyWith<$Res> {
  __$TheatersCopyWithImpl(this._self, this._then);

  final _Theaters _self;
  final $Res Function(_Theaters) _then;

/// Create a copy of Theaters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? pictureAvatar = freezed,Object? pictureBuklet = freezed,Object? pictureBanner = freezed,Object? palace = freezed,Object? palaceHall = freezed,Object? palace_name_uz = freezed,Object? palace_name_ru = freezed,Object? palace_address_uz = freezed,Object? palace_address_ru = freezed,Object? category_name = freezed,Object? longitude = freezed,Object? latitude = freezed,Object? session = freezed,Object? created_at = freezed,Object? updated_at = freezed,Object? eventId = freezed,Object? eventTypeId = freezed,Object? eventTypeName = freezed,Object? eventTypeName_en = freezed,Object? eventTypeName_uz = freezed,Object? eventTypeName_qr = freezed,Object? eventTypeName_ru = freezed,Object? organizatorId = freezed,Object? name = freezed,Object? name_en = freezed,Object? name_uz = freezed,Object? name_qr = freezed,Object? name_ru = freezed,Object? shortName = freezed,Object? shortName_en = freezed,Object? shortName_uz = freezed,Object? shortName_qr = freezed,Object? shortName_ru = freezed,Object? content = freezed,Object? content_en = freezed,Object? content_uz = freezed,Object? content_qr = freezed,Object? content_ru = freezed,Object? beginDate = freezed,Object? endDate = freezed,Object? ageLimited = freezed,Object? ageLimitName = freezed,Object? ageLimitName_en = freezed,Object? ageLimitName_uz = freezed,Object? ageLimitName_qr = freezed,Object? ageLimitName_ru = freezed,Object? isRejectTicket = freezed,Object? isVerificationUser = freezed,Object? isEvenPrivileges = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? date = freezed,Object? currency = freezed,Object? isWithoutSeats = freezed,Object? videoClip = freezed,Object? privilegesRound = freezed,Object? invitationCount = freezed,Object? isUseDiscountToPrivileges = freezed,Object? category = freezed,Object? actors = freezed,}) {
  return _then(_Theaters(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,pictureAvatar: freezed == pictureAvatar ? _self.pictureAvatar : pictureAvatar // ignore: cast_nullable_to_non_nullable
as String?,pictureBuklet: freezed == pictureBuklet ? _self.pictureBuklet : pictureBuklet // ignore: cast_nullable_to_non_nullable
as String?,pictureBanner: freezed == pictureBanner ? _self.pictureBanner : pictureBanner // ignore: cast_nullable_to_non_nullable
as String?,palace: freezed == palace ? _self.palace : palace // ignore: cast_nullable_to_non_nullable
as int?,palaceHall: freezed == palaceHall ? _self.palaceHall : palaceHall // ignore: cast_nullable_to_non_nullable
as int?,palace_name_uz: freezed == palace_name_uz ? _self.palace_name_uz : palace_name_uz // ignore: cast_nullable_to_non_nullable
as String?,palace_name_ru: freezed == palace_name_ru ? _self.palace_name_ru : palace_name_ru // ignore: cast_nullable_to_non_nullable
as String?,palace_address_uz: freezed == palace_address_uz ? _self.palace_address_uz : palace_address_uz // ignore: cast_nullable_to_non_nullable
as String?,palace_address_ru: freezed == palace_address_ru ? _self.palace_address_ru : palace_address_ru // ignore: cast_nullable_to_non_nullable
as String?,category_name: freezed == category_name ? _self.category_name : category_name // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,session: freezed == session ? _self._session : session // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,created_at: freezed == created_at ? _self.created_at : created_at // ignore: cast_nullable_to_non_nullable
as String?,updated_at: freezed == updated_at ? _self.updated_at : updated_at // ignore: cast_nullable_to_non_nullable
as String?,eventId: freezed == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as int?,eventTypeId: freezed == eventTypeId ? _self.eventTypeId : eventTypeId // ignore: cast_nullable_to_non_nullable
as int?,eventTypeName: freezed == eventTypeName ? _self.eventTypeName : eventTypeName // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_en: freezed == eventTypeName_en ? _self.eventTypeName_en : eventTypeName_en // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_uz: freezed == eventTypeName_uz ? _self.eventTypeName_uz : eventTypeName_uz // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_qr: freezed == eventTypeName_qr ? _self.eventTypeName_qr : eventTypeName_qr // ignore: cast_nullable_to_non_nullable
as String?,eventTypeName_ru: freezed == eventTypeName_ru ? _self.eventTypeName_ru : eventTypeName_ru // ignore: cast_nullable_to_non_nullable
as String?,organizatorId: freezed == organizatorId ? _self.organizatorId : organizatorId // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,name_en: freezed == name_en ? _self.name_en : name_en // ignore: cast_nullable_to_non_nullable
as String?,name_uz: freezed == name_uz ? _self.name_uz : name_uz // ignore: cast_nullable_to_non_nullable
as String?,name_qr: freezed == name_qr ? _self.name_qr : name_qr // ignore: cast_nullable_to_non_nullable
as String?,name_ru: freezed == name_ru ? _self.name_ru : name_ru // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _self.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,shortName_en: freezed == shortName_en ? _self.shortName_en : shortName_en // ignore: cast_nullable_to_non_nullable
as String?,shortName_uz: freezed == shortName_uz ? _self.shortName_uz : shortName_uz // ignore: cast_nullable_to_non_nullable
as String?,shortName_qr: freezed == shortName_qr ? _self.shortName_qr : shortName_qr // ignore: cast_nullable_to_non_nullable
as String?,shortName_ru: freezed == shortName_ru ? _self.shortName_ru : shortName_ru // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,content_en: freezed == content_en ? _self.content_en : content_en // ignore: cast_nullable_to_non_nullable
as String?,content_uz: freezed == content_uz ? _self.content_uz : content_uz // ignore: cast_nullable_to_non_nullable
as String?,content_qr: freezed == content_qr ? _self.content_qr : content_qr // ignore: cast_nullable_to_non_nullable
as String?,content_ru: freezed == content_ru ? _self.content_ru : content_ru // ignore: cast_nullable_to_non_nullable
as String?,beginDate: freezed == beginDate ? _self.beginDate : beginDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,ageLimited: freezed == ageLimited ? _self.ageLimited : ageLimited // ignore: cast_nullable_to_non_nullable
as int?,ageLimitName: freezed == ageLimitName ? _self.ageLimitName : ageLimitName // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_en: freezed == ageLimitName_en ? _self.ageLimitName_en : ageLimitName_en // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_uz: freezed == ageLimitName_uz ? _self.ageLimitName_uz : ageLimitName_uz // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_qr: freezed == ageLimitName_qr ? _self.ageLimitName_qr : ageLimitName_qr // ignore: cast_nullable_to_non_nullable
as String?,ageLimitName_ru: freezed == ageLimitName_ru ? _self.ageLimitName_ru : ageLimitName_ru // ignore: cast_nullable_to_non_nullable
as String?,isRejectTicket: freezed == isRejectTicket ? _self.isRejectTicket : isRejectTicket // ignore: cast_nullable_to_non_nullable
as bool?,isVerificationUser: freezed == isVerificationUser ? _self.isVerificationUser : isVerificationUser // ignore: cast_nullable_to_non_nullable
as bool?,isEvenPrivileges: freezed == isEvenPrivileges ? _self.isEvenPrivileges : isEvenPrivileges // ignore: cast_nullable_to_non_nullable
as bool?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,isWithoutSeats: freezed == isWithoutSeats ? _self.isWithoutSeats : isWithoutSeats // ignore: cast_nullable_to_non_nullable
as bool?,videoClip: freezed == videoClip ? _self.videoClip : videoClip // ignore: cast_nullable_to_non_nullable
as String?,privilegesRound: freezed == privilegesRound ? _self.privilegesRound : privilegesRound // ignore: cast_nullable_to_non_nullable
as int?,invitationCount: freezed == invitationCount ? _self.invitationCount : invitationCount // ignore: cast_nullable_to_non_nullable
as int?,isUseDiscountToPrivileges: freezed == isUseDiscountToPrivileges ? _self.isUseDiscountToPrivileges : isUseDiscountToPrivileges // ignore: cast_nullable_to_non_nullable
as bool?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int?,actors: freezed == actors ? _self._actors : actors // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
