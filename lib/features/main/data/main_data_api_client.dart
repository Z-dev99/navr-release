// ignore_for_file: invalid_annotation_target

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_data_api_client.g.dart';
part 'main_data_api_client.freezed.dart';

@injectable
@RestApi()
abstract class MainDataApiClient {
  @factoryMethod
  factory MainDataApiClient(
    Dio dio, {
    @Named('baseUrl') required String baseUrl,
  }) = _MainDataApiClient;

  @GET('/category')
  Future<List<CategoryModel>> getCategories();

  @GET('/main/images')
  Future<List<BannerModel>> getPosters();

  @GET('/eventswithimage')
  Future<EventsResponse> getEvents({
    @Query('cat') String? category,
    @Query('page') int? page,
    @Query('query') String? query,
  });
}

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    int? id,
    String? name,
    @JsonKey(name: 'name_en') String? nameEn,
    @JsonKey(name: 'name_uz') String? nameUz,
    @JsonKey(name: 'name_qr') String? nameQr,
    @JsonKey(name: 'name_ru') String? nameRu,
    String? thumb,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
abstract class BannerModel with _$BannerModel {
  const factory BannerModel({
    required int id,
    required String image,
    required bool status,
    @JsonKey(defaultValue: 0) required int priority,
    String? link,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

@freezed
abstract class EventsResponse with _$EventsResponse {
  const factory EventsResponse({
    required int count,
    @Default('') String? next,
    @Default('') String? previous,
    @Default(<Event>[]) List<Event> results,
  }) = _EventsResponse;

  factory EventsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventsResponseFromJson(json);
}

@freezed
abstract class Event with _$Event {
  const factory Event({
    int? id,
    String? pictureAvatar,
    String? pictureBuklet,
    String? pictureBanner,
    int? palace,
    int? palaceHall,
    String? palace_name_uz,
    String? palace_name_ru,
    String? palace_address_uz,
    String? palace_address_ru,
    String? category_name,
    String? longitude,
    String? latitude,
    List<dynamic>? session,
    String? created_at,
    String? updated_at,
    int? eventId,
    int? eventTypeId,
    String? eventTypeName,
    String? eventTypeName_en,
    String? eventTypeName_uz,
    String? eventTypeName_qr,
    String? eventTypeName_ru,
    int? organizatorId,
    String? name,
    String? name_en,
    String? name_uz,
    String? name_qr,
    String? name_ru,
    String? shortName,
    String? shortName_en,
    String? shortName_uz,
    String? shortName_qr,
    String? shortName_ru,
    String? content,
    String? content_en,
    String? content_uz,
    String? content_qr,
    String? content_ru,
    String? beginDate,
    String? endDate,
    @JsonKey(defaultValue: 0) int? ageLimited,
    String? ageLimitName,
    String? ageLimitName_en,
    String? ageLimitName_uz,
    String? ageLimitName_qr,
    String? ageLimitName_ru,
    @JsonKey(defaultValue: false) bool? isRejectTicket,
    bool? isVerificationUser,
    bool? isEvenPrivileges,
    @JsonKey(defaultValue: 0) int? minPrice,
    @JsonKey(defaultValue: 0) int? maxPrice,
    String? date,
    String? currency,
    bool? isWithoutSeats,
    String? videoClip,
    @JsonKey(defaultValue: 0) int? privilegesRound,
    int? invitationCount,
    bool? isUseDiscountToPrivileges,
    int? category,
    List<dynamic>? actors,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
