import 'package:injectable/injectable.dart';

import 'main_data_api_client.dart';

@lazySingleton
class MainDataRepository {
  final MainDataApiClient _apiClient;

  MainDataRepository(this._apiClient);

  Future<List<CategoryModel>> fetchCategories() async {
    return await _apiClient.getCategories();
  }

  Future<List<BannerModel>> fetchPosters() async {
    return await _apiClient.getPosters();
  }

  Future<EventsResponse> fetchEvents({
    String? category,
    int? page,
    String? query,
  }) async {
    return await _apiClient.getEvents(
      category: category,
      page: page,
      query: query,
    );
  }
}
