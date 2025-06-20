import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/di.dart';
import 'package:navr_app/features/login/service/auth_service.dart';
import 'package:navr_app/features/login/widgets/login_form_button.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:navr_app/widgets/login/login_text_field.dart';
import 'package:provider/provider.dart';

class LoginFormRegister extends StatelessWidget {
  const LoginFormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginFormRegisterProvider>(
      create: (context) => LoginFormRegisterProvider(),
      child: Form(child: LoginFormRegisterContent()),
    );
  }
}

class LoginFormRegisterContent extends StatelessWidget {
  const LoginFormRegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginFormRegisterProvider model =
        Provider.of<LoginFormRegisterProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 28),
        LoginTextField(
          controller: model.emailController,
          label: 'Email',
          hint: tr('login.email'),
          errorText: model.emailError,
        ),
        const SizedBox(height: 16),
        LoginTextField(
          controller: model.passwordController,
          label: tr('login.password'),
          hint: tr('login.passwordHint'),
          obscureText: true,
          errorText: model.passwordError,
        ),
        if (model.generalError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              model.generalError!,
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 28),
        const LoginFormRegisterInfo(),
        const SizedBox(height: 28),
        const LoginFormRegisterPolicy(),
        const SizedBox(height: 28),
        LoginFormButton(
          text: model.isLoading ? tr('login.loading') : tr('login.enterButton'),
          onPressed: model.isLoading ? null : () => model.login(context),
        ),
      ],
    );
  }
}

class LoginFormRegisterInfo extends StatelessWidget {
  const LoginFormRegisterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: Color(0xff430000),
          fontFamily: 'Inter',
          height: 1.4,
        ),
        children: <TextSpan>[
          TextSpan(text: tr('registration.beforeRegister')),
          TextSpan(
            text: ' ${tr('registration.agreement')}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormRegisterPolicy extends StatelessWidget {
  const LoginFormRegisterPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Row(
      children: <Widget>[
        Checkbox(
          value: true,
          onChanged: (value) {},
          checkColor: Colors.white,
          visualDensity: VisualDensity(horizontal: -4, vertical: 0),
          splashRadius: 0,
          activeColor: Color(0xff430000),
          fillColor: WidgetStatePropertyAll(Color(0xff430000)),
          overlayColor: WidgetStatePropertyAll(Color(0xff430000)),
          side: BorderSide(color: Color(0xff430000)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        SizedBox(width: 10),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff430000),
                fontFamily: 'Inter',
                height: 1.4,
              ),
              children: <TextSpan>[
                TextSpan(text: tr('registration.agreeYes')),
                TextSpan(
                  text: '\t${tr('registration.termsOfUse')} ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: tr('registration.siteName')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginFormRegisterProvider extends ChangeNotifier {
  LoginFormRegisterProvider();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailError;
  String? passwordError;
  String? generalError;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool validate() {
    emailError = null;
    passwordError = null;
    generalError = null;

    final email = emailController.text.trim();
    final password = passwordController.text;

    bool isValid = true;

    if (email.isEmpty || !email.contains('@')) {
      emailError = 'Введите корректный email';
      isValid = false;
    }

    if (password.isEmpty || password.length < 6) {
      passwordError = 'Минимум 6 символов';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<void> login(BuildContext context) async {
    if (!validate()) return;
    setLoading(true);
    try {
      await sl<AuthService>().register(
        username: emailController.text.trim(),
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      context.router.replace(const DashboardRoute());
      generalError = null;
    } catch (e) {
      generalError = e.toString().replaceFirst('Exception: ', '');
    } finally {
      setLoading(false);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
