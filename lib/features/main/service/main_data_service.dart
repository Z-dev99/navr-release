import 'package:injectable/injectable.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/features/main/data/main_data_repository.dart';

@lazySingleton
class MainDataService {
  final MainDataRepository _repository;

  MainDataService(this._repository);

  Future<List<CategoryModel>> getCategories() async {
    try {
      return await _repository.fetchCategories();
    } catch (e, _) {
      return [];
    }
  }

  Future<List<BannerModel>> getPosters() async {
    try {
      return await _repository.fetchPosters();
    } catch (e, _) {
      return [];
    }
  }

  Future<EventsResponse> getEvents({
    String? category,
    int? page,
    String? query,
  }) async {
    try {
      return await _repository.fetchEvents(
        category: category,
        page: page,
        query: query,
      );
    } catch (e, _) {
      return EventsResponse(count: 0, next: null, previous: null, results: []);
    }
  }

  Future<Map<String, dynamic>> getMainScreenData() async {
    try {
      final categories = await getCategories();
      final posters = await getPosters();
      final events = await getEvents(page: 1, category: '', query: '');

      return {'categories': categories, 'posters': posters, 'events': events};
    } catch (e, _) {
      return {
        'categories': [],
        'posters': [],
        'events': EventsResponse(
          count: 0,
          next: null,
          previous: null,
          results: [],
        ),
      };
    }
  }
}
