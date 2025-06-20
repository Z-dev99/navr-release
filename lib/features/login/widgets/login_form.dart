import 'package:flutter/material.dart';
import 'package:navr_app/features/login/widgets/login_form_divider.dart';
import 'package:navr_app/features/login/widgets/login_form_options.dart';
import 'package:navr_app/features/login/widgets/login_form_tab_bar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 20),
        LoginFormOptions(),
        LoginFormDivider(),
        LoginFormTabBar(),
      ],
    ),
  );
}




