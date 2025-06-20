// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:navr_app/features/dashboard/screens/dashboard_screen.dart'
    as _i1;
import 'package:navr_app/features/detail/screens/detail_screen.dart' as _i2;
import 'package:navr_app/features/login/screens/login_screen.dart' as _i3;
import 'package:navr_app/features/main/screens/main_screen.dart' as _i4;
import 'package:navr_app/features/profile/screens/profile_screen.dart' as _i5;
import 'package:navr_app/features/splash/splash_screen.dart' as _i6;
import 'package:navr_app/features/theaters/screens/theaters_screen.dart' as _i7;

/// generated route for
/// [_i1.DashboardScreen]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i2.DetailScreen]
class DetailRoute extends _i8.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i9.Key? key,
    required dynamic eventData,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         DetailRoute.name,
         args: DetailRouteArgs(key: key, eventData: eventData),
         initialChildren: children,
       );

  static const String name = 'DetailRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailRouteArgs>();
      return _i2.DetailScreen(key: args.key, eventData: args.eventData);
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.eventData});

  final _i9.Key? key;

  final dynamic eventData;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, eventData: $eventData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DetailRouteArgs) return false;
    return key == other.key && eventData == other.eventData;
  }

  @override
  int get hashCode => key.hashCode ^ eventData.hashCode;
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainScreen();
    },
  );
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}

/// generated route for
/// [_i7.TheatersScreen]
class TheatersRoute extends _i8.PageRouteInfo<void> {
  const TheatersRoute({List<_i8.PageRouteInfo>? children})
    : super(TheatersRoute.name, initialChildren: children);

  static const String name = 'TheatersRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.TheatersScreen();
    },
  );
}
