import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart';

final getIt = GetIt.instance;
final sl = getIt;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class AppModule {
  const AppModule();

  @Named('baseUrl')
  String get baseUrl => 'https://back.navr.uz/api';

  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    return dio;
  }
}
