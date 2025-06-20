import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/features/login/widgets/login_form_auth.dart';
import 'package:navr_app/features/login/widgets/login_form_register.dart';

class LoginFormTabBar extends StatefulWidget {
  const LoginFormTabBar({super.key});

  @override
  State<LoginFormTabBar> createState() => _LoginFormTabBarState();
}

class _LoginFormTabBarState extends State<LoginFormTabBar>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    return RepaintBoundary(
      child: SizedBox(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            TabBar(
              controller: _controller,
              dividerHeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Color(0xff430000),
              indicatorColor: Color(0xff430000),
              unselectedLabelColor: Color(0xffc97f7f),
              dividerColor: Color(0xffc97f7f),
              tabs: [
                SizedBox(height: 40, child: Text(tr('login.enter'))),
                SizedBox(height: 40, child: Text(tr('login.registration'))),
              ],
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: _controller.index == 0
                  ? LoginFormAuth()
                  : LoginFormRegister(),
            ),
          ],
        ),
      ),
    );
  }
}
