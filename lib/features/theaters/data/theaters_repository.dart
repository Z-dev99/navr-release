import 'package:injectable/injectable.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/features/theaters/data/theaters_api_client.dart';

@lazySingleton
class TheatersRepository {
  final TheatersApiClient _apiClient;

  TheatersRepository(this._apiClient);

  Future<List<CategoryModel>> fetchCategories() async {
    return await _apiClient.getCategories();
  }

  Future<TheatersResponse> getEvents({
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
