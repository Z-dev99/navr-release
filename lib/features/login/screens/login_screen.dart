import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/features/login/widgets/login_form.dart';
import 'package:navr_app/widgets/login/login_form_container.dart';
import 'package:navr_app/widgets/primary_app_bar.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const PrimaryAppBar(withMargin: true),
    body: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.only(left: 16, right: 16, top: 40),
      child: LoginFormContainer(child: LoginForm()),
    ),
  );
}
