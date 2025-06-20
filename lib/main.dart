import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:navr_app/app.dart';
import 'package:navr_app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FastCachedImageConfig.init();
  await configureDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load();
  runApp(
    EasyLocalization(
      supportedLocales: <Locale>[Locale('ru'), Locale('uz')],
      path: 'assets/translations',
      startLocale: Locale('ru'),
      child: const NavrApp(),
    ),
  );
}
