// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navr_app/di.dart' as _i348;
import 'package:navr_app/features/login/data/auth_api_client.dart' as _i498;
import 'package:navr_app/features/login/data/auth_repository.dart' as _i208;
import 'package:navr_app/features/login/service/auth_service.dart' as _i375;
import 'package:navr_app/features/main/data/main_data_api_client.dart' as _i990;
import 'package:navr_app/features/main/data/main_data_repository.dart'
    as _i1035;
import 'package:navr_app/features/main/service/main_data_service.dart' as _i953;
import 'package:navr_app/features/theaters/data/theaters_api_client.dart'
    as _i233;
import 'package:navr_app/features/theaters/data/theaters_repository.dart'
    as _i335;
import 'package:navr_app/features/theaters/service/theaters_service.dart'
    as _i339;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<String>(() => appModule.baseUrl, instanceName: 'baseUrl');
    gh.lazySingleton<_i361.Dio>(
      () => appModule.dio(gh<String>(instanceName: 'baseUrl')),
    );
    gh.factory<_i498.AuthApiClient>(
      () => _i498.AuthApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.factory<_i990.MainDataApiClient>(
      () => _i990.MainDataApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.factory<_i233.TheatersApiClient>(
      () => _i233.TheatersApiClient(
        gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
      ),
    );
    gh.lazySingleton<_i1035.MainDataRepository>(
      () => _i1035.MainDataRepository(gh<_i990.MainDataApiClient>()),
    );
    gh.lazySingleton<_i953.MainDataService>(
      () => _i953.MainDataService(gh<_i1035.MainDataRepository>()),
    );
    gh.singleton<_i375.AuthService>(
      () => _i375.AuthService(gh<_i498.AuthApiClient>()),
    );
    gh.factory<_i208.AuthRepository>(
      () => _i208.AuthRepository(apiClient: gh<_i498.AuthApiClient>()),
    );
    gh.lazySingleton<_i335.TheatersRepository>(
      () => _i335.TheatersRepository(gh<_i233.TheatersApiClient>()),
    );
    gh.lazySingleton<_i339.TheatersService>(
      () => _i339.TheatersService(gh<_i335.TheatersRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i348.AppModule {}
