import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navr_app/routes.dart';

class NavrApp extends StatelessWidget {
  const NavrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xffA10000),
        ),
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          showPerformanceOverlay: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
    );
  }
}

final AppRouter _appRouter = AppRouter();
