// ignore_for_file: invalid_annotation_target

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'theaters_api_client.g.dart';
part 'theaters_api_client.freezed.dart';

@injectable
@RestApi()
abstract class TheatersApiClient {
  @factoryMethod
  factory TheatersApiClient(
    Dio dio, {
    @Named('baseUrl') required String baseUrl,
  }) = _TheatersApiClient;

  @GET('/category')
  Future<List<CategoryModel>> getCategories();

  @GET('/eventswithimage/')
  Future<TheatersResponse> getEvents({
    @Query('cat') String? category,
    @Query('page') int? page,
    @Query('query') String? query,
  });
}

@freezed
abstract class TheatersResponse with _$TheatersResponse {
  const factory TheatersResponse({
    required int count,
    @Default('') String? next,
    @Default('') String? previous,
    @Default(<Theaters>[]) List<Theaters> results,
  }) = _TheatersResponse;

  factory TheatersResponse.fromJson(Map<String, dynamic> json) =>
      _$TheatersResponseFromJson(json);
}

@freezed
abstract class Theaters with _$Theaters {
  const factory Theaters({
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
  }) = _Theaters;

  factory Theaters.fromJson(Map<String, dynamic> json) =>
      _$TheatersFromJson(json);
}
