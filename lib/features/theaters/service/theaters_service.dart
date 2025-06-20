import 'package:injectable/injectable.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/features/theaters/data/theaters_repository.dart';

@lazySingleton
class TheatersService {
  final TheatersRepository _repository;

  TheatersService(this._repository);

  Future<List<CategoryModel>> getCategories() async {
    try {
      return await _repository.fetchCategories();
    } catch (e, _) {
      return [];
    }
  }

  Future<Map<String, dynamic>> getMainScreenData({int page = 1}) async {
    try {
      final List<CategoryModel> categories = await getCategories();

      final theaterCategory = categories.firstWhere(
        (cat) =>
            cat.name?.toLowerCase().contains('театр') == true ||
            cat.name?.toLowerCase().contains('teatr') == true,
        orElse: () => CategoryModel(id: -1, name: 'Не найдено'),
      );

      final int categoryId = theaterCategory.id ?? -1;

      final events = categoryId != -1
          ? await _repository.getEvents(
              category: categoryId.toString(),
              page: page,
            )
          : const EventsResponse(count: 0, results: []);

      return {
        'categories': categories,
        'theaterCategoryId': categoryId,
        'events': events,
      };
    } catch (e, _) {
      return {
        'categories': [],
        'theaterCategoryId': -1,
        'events': const EventsResponse(count: 0, results: []),
      };
    }
  }
}
