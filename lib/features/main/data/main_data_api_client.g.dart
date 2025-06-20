// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data_api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
      nameUz: json['name_uz'] as String?,
      nameQr: json['name_qr'] as String?,
      nameRu: json['name_ru'] as String?,
      thumb: json['thumb'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_uz': instance.nameUz,
      'name_qr': instance.nameQr,
      'name_ru': instance.nameRu,
      'thumb': instance.thumb,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => _BannerModel(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  status: json['status'] as bool,
  priority: (json['priority'] as num?)?.toInt() ?? 0,
  link: json['link'] as String?,
);

Map<String, dynamic> _$BannerModelToJson(_BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'status': instance.status,
      'priority': instance.priority,
      'link': instance.link,
    };

_EventsResponse _$EventsResponseFromJson(Map<String, dynamic> json) =>
    _EventsResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Event>[],
    );

Map<String, dynamic> _$EventsResponseToJson(_EventsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  id: (json['id'] as num?)?.toInt(),
  pictureAvatar: json['pictureAvatar'] as String?,
  pictureBuklet: json['pictureBuklet'] as String?,
  pictureBanner: json['pictureBanner'] as String?,
  palace: (json['palace'] as num?)?.toInt(),
  palaceHall: (json['palaceHall'] as num?)?.toInt(),
  palace_name_uz: json['palace_name_uz'] as String?,
  palace_name_ru: json['palace_name_ru'] as String?,
  palace_address_uz: json['palace_address_uz'] as String?,
  palace_address_ru: json['palace_address_ru'] as String?,
  category_name: json['category_name'] as String?,
  longitude: json['longitude'] as String?,
  latitude: json['latitude'] as String?,
  session: json['session'] as List<dynamic>?,
  created_at: json['created_at'] as String?,
  updated_at: json['updated_at'] as String?,
  eventId: (json['eventId'] as num?)?.toInt(),
  eventTypeId: (json['eventTypeId'] as num?)?.toInt(),
  eventTypeName: json['eventTypeName'] as String?,
  eventTypeName_en: json['eventTypeName_en'] as String?,
  eventTypeName_uz: json['eventTypeName_uz'] as String?,
  eventTypeName_qr: json['eventTypeName_qr'] as String?,
  eventTypeName_ru: json['eventTypeName_ru'] as String?,
  organizatorId: (json['organizatorId'] as num?)?.toInt(),
  name: json['name'] as String?,
  name_en: json['name_en'] as String?,
  name_uz: json['name_uz'] as String?,
  name_qr: json['name_qr'] as String?,
  name_ru: json['name_ru'] as String?,
  shortName: json['shortName'] as String?,
  shortName_en: json['shortName_en'] as String?,
  shortName_uz: json['shortName_uz'] as String?,
  shortName_qr: json['shortName_qr'] as String?,
  shortName_ru: json['shortName_ru'] as String?,
  content: json['content'] as String?,
  content_en: json['content_en'] as String?,
  content_uz: json['content_uz'] as String?,
  content_qr: json['content_qr'] as String?,
  content_ru: json['content_ru'] as String?,
  beginDate: json['beginDate'] as String?,
  endDate: json['endDate'] as String?,
  ageLimited: (json['ageLimited'] as num?)?.toInt() ?? 0,
  ageLimitName: json['ageLimitName'] as String?,
  ageLimitName_en: json['ageLimitName_en'] as String?,
  ageLimitName_uz: json['ageLimitName_uz'] as String?,
  ageLimitName_qr: json['ageLimitName_qr'] as String?,
  ageLimitName_ru: json['ageLimitName_ru'] as String?,
  isRejectTicket: json['isRejectTicket'] as bool? ?? false,
  isVerificationUser: json['isVerificationUser'] as bool?,
  isEvenPrivileges: json['isEvenPrivileges'] as bool?,
  minPrice: (json['minPrice'] as num?)?.toInt() ?? 0,
  maxPrice: (json['maxPrice'] as num?)?.toInt() ?? 0,
  date: json['date'] as String?,
  currency: json['currency'] as String?,
  isWithoutSeats: json['isWithoutSeats'] as bool?,
  videoClip: json['videoClip'] as String?,
  privilegesRound: (json['privilegesRound'] as num?)?.toInt() ?? 0,
  invitationCount: (json['invitationCount'] as num?)?.toInt(),
  isUseDiscountToPrivileges: json['isUseDiscountToPrivileges'] as bool?,
  category: (json['category'] as num?)?.toInt(),
  actors: json['actors'] as List<dynamic>?,
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'id': instance.id,
  'pictureAvatar': instance.pictureAvatar,
  'pictureBuklet': instance.pictureBuklet,
  'pictureBanner': instance.pictureBanner,
  'palace': instance.palace,
  'palaceHall': instance.palaceHall,
  'palace_name_uz': instance.palace_name_uz,
  'palace_name_ru': instance.palace_name_ru,
  'palace_address_uz': instance.palace_address_uz,
  'palace_address_ru': instance.palace_address_ru,
  'category_name': instance.category_name,
  'longitude': instance.longitude,
  'latitude': instance.latitude,
  'session': instance.session,
  'created_at': instance.created_at,
  'updated_at': instance.updated_at,
  'eventId': instance.eventId,
  'eventTypeId': instance.eventTypeId,
  'eventTypeName': instance.eventTypeName,
  'eventTypeName_en': instance.eventTypeName_en,
  'eventTypeName_uz': instance.eventTypeName_uz,
  'eventTypeName_qr': instance.eventTypeName_qr,
  'eventTypeName_ru': instance.eventTypeName_ru,
  'organizatorId': instance.organizatorId,
  'name': instance.name,
  'name_en': instance.name_en,
  'name_uz': instance.name_uz,
  'name_qr': instance.name_qr,
  'name_ru': instance.name_ru,
  'shortName': instance.shortName,
  'shortName_en': instance.shortName_en,
  'shortName_uz': instance.shortName_uz,
  'shortName_qr': instance.shortName_qr,
  'shortName_ru': instance.shortName_ru,
  'content': instance.content,
  'content_en': instance.content_en,
  'content_uz': instance.content_uz,
  'content_qr': instance.content_qr,
  'content_ru': instance.content_ru,
  'beginDate': instance.beginDate,
  'endDate': instance.endDate,
  'ageLimited': instance.ageLimited,
  'ageLimitName': instance.ageLimitName,
  'ageLimitName_en': instance.ageLimitName_en,
  'ageLimitName_uz': instance.ageLimitName_uz,
  'ageLimitName_qr': instance.ageLimitName_qr,
  'ageLimitName_ru': instance.ageLimitName_ru,
  'isRejectTicket': instance.isRejectTicket,
  'isVerificationUser': instance.isVerificationUser,
  'isEvenPrivileges': instance.isEvenPrivileges,
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'date': instance.date,
  'currency': instance.currency,
  'isWithoutSeats': instance.isWithoutSeats,
  'videoClip': instance.videoClip,
  'privilegesRound': instance.privilegesRound,
  'invitationCount': instance.invitationCount,
  'isUseDiscountToPrivileges': instance.isUseDiscountToPrivileges,
  'category': instance.category,
  'actors': instance.actors,
};

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _MainDataApiClient implements MainDataApiClient {
  _MainDataApiClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<CategoryModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/category',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<CategoryModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => CategoryModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<List<BannerModel>> getPosters() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<BannerModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/main/images',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<BannerModel> _value;
    try {
      _value = _result.data!
          .map((dynamic i) => BannerModel.fromJson(i as Map<String, dynamic>))
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<EventsResponse> getEvents({
    String? category,
    int? page,
    String? query,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'cat': category,
      r'page': page,
      r'query': query,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<EventsResponse>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/eventswithimage',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late EventsResponse _value;
    try {
      _value = EventsResponse.fromJson(_result.data!);
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
