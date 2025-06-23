import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:navr_app/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
final class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: LoginRoute.page,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 300),
    ),
    CustomRoute(
      page: SplashRoute.page,
      duration: Duration(milliseconds: 300),
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    CustomRoute(
      page: DetailRoute.page,
      duration: Duration(milliseconds: 300),
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),

    CustomRoute(
      page: DashboardRoute.page,
      guards: [AuthGuard()],
      transitionsBuilder: TransitionsBuilders.fadeIn,
      duration: Duration(milliseconds: 300),
      children: <CustomRoute>[
        CustomRoute(
          page: MainRoute.page,
          duration: Duration(milliseconds: 200),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          initial: true,
        ),
        CustomRoute(
          page: TheatersRoute.page,
          duration: Duration(milliseconds: 200),
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: InfoRoute.page,
          duration: Duration(milliseconds: 300),
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          duration: Duration(milliseconds: 200),
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  final _authCheckUseCase = AuthCheckUseCase(SharedPrefsAuthRepository());

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isAuthenticated = await _authCheckUseCase.execute();

    if (isAuthenticated) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.replace(const LoginRoute());
    }
  }
}

class AuthCheckUseCase {
  final IAuthRepository _repository;

  AuthCheckUseCase(this._repository);

  Future<bool> execute() async {
    final token = await _repository.getAccessToken();
    return token != null && token.isNotEmpty;
  }
}

abstract class IAuthRepository {
  Future<String?> getAccessToken();
}

class SharedPrefsAuthRepository implements IAuthRepository {
  @override
  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
}
