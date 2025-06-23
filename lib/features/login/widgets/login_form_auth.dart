import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/di.dart';
import 'package:navr_app/features/login/service/auth_service.dart';
import 'package:navr_app/features/login/widgets/login_form_button.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:navr_app/widgets/login/login_text_field.dart';
import 'package:provider/provider.dart';

class LoginFormAuth extends StatelessWidget {
  const LoginFormAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginFormAuthProvider>(
      create: (context) => LoginFormAuthProvider(),
      child: const SizedBox(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: LoginFormAuthContent(),
        ),
      ),
    );
  }
}

class LoginFormAuthContent extends StatelessWidget {
  const LoginFormAuthContent({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginFormAuthProvider model = Provider.of<LoginFormAuthProvider>(
      context,
    );
    context.locale;
    return Column(
      children: <Widget>[
        SizedBox(height: 28),
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
              context.locale.languageCode == 'ru'
                  ? 'Неправильный логин или пароль'
                  : 'Noto\'g\'ri login yoki parol',
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 24),
        LoginFormAuthRemember(),
        const SizedBox(height: 24),
        LoginFormButton(
          text: model.isLoading ? tr('login.loading') : tr('login.enterButton'),
          onPressed: model.isLoading ? null : () => model.login(context),
        ),
      ],
    );
  }
}

class LoginFormAuthRemember extends StatefulWidget {
  const LoginFormAuthRemember({super.key});

  @override
  State<LoginFormAuthRemember> createState() => _LoginFormAuthRememberState();
}

class _LoginFormAuthRememberState extends State<LoginFormAuthRemember> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    context.locale;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue ?? false;
            });
          },
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
        Text(
          tr('login.remember'),
          style: TextStyle(color: Color(0xff430000), fontFamily: 'Inter'),
        ),
      ],
    );
  }
}

class LoginFormAuthProvider extends ChangeNotifier {
  LoginFormAuthProvider();

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
      await sl<AuthService>().login(
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
