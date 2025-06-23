import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:http/http.dart' as http;
import 'package:navr_app/routes.gr.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginFormOptions extends StatelessWidget {
  const LoginFormOptions({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return ChangeNotifierProvider<SignInWithGoogleProvider>(
      create: (context) => SignInWithGoogleProvider(),
      child: Row(
        children: <Widget>[LoginFormOptionsItem(text: tr('login.google'))],
      ),
    );
  }
}

class LoginFormOptionsItem extends StatefulWidget {
  final String iconPath;
  final String text;

  const LoginFormOptionsItem({
    super.key,
    this.iconPath = 'assets/icons/google.svg',
    this.text = '',
  });

  @override
  State<LoginFormOptionsItem> createState() => _LoginFormOptionsItemState();
}

class _LoginFormOptionsItemState extends State<LoginFormOptionsItem> {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(6);
    final gradient = LinearGradient(
      colors: [Color(0xffEA4747), Color(0xff4D0808)],
    );
    final SignInWithGoogleProvider model =
        Provider.of<SignInWithGoogleProvider>(context);
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xffFFF7F7),
          borderRadius: borderRadius,
          border: GradientBoxBorder(gradient: gradient),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 5,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: !model.isLoading
            ? TextButton.icon(
                onPressed: () => model.signIn(context),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: borderRadius),
                  foregroundColor: const Color(0xff430000),
                  overlayColor: Colors.transparent,
                ),
                icon: SvgPicture.asset(widget.iconPath, width: 16, height: 16),
                label: AutoSizeText(
                  widget.text,
                  maxLines: 1,
                  minFontSize: 10,
                  maxFontSize: 12,
                  style: const TextStyle(fontSize: 10),
                ),
              )
            : SizedBox(
                height: 52,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Color(0xff4D0808)),
                  ),
                ),
              ),
      ),
    );
  }
}

class SignInWithGoogleProvider extends ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Platform.isAndroid
        ? dotenv.env['GOOGLE_CLIENT_ID']
        : Platform.isIOS
        ? dotenv.env['GOOGLE_CLIENT_ID_IOS']
        : dotenv.env['GOOGLE_CLIENT_ID_WEB'],
    serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],

    forceCodeForRefreshToken: true,
    scopes: ['email', 'openid'],
  );

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    _setLoading(true);
    _googleSignIn.signOut();
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        _setLoading(false);
        return;
      }

      final auth = await account.authentication;
      print(auth.idToken);
      if (auth.idToken == null) {
        await Future.delayed(Duration(milliseconds: 300));
        _setLoading(false);
        return;
      }
      final response = await http.post(
        Uri.parse('https://back.navr.uz/api/auth/google/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': auth.idToken}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('access_token', jsonData['access'] ?? '');
        _prefs.setString('user', json.encode(jsonData['user']));
        context.router.replace(const DashboardRoute());
        await _googleSignIn.signOut();
      }
    } catch (e) {
      e;
      print(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
  }
}
