import 'package:flutter/material.dart';

class LoginFormContainer extends StatelessWidget {
  final Widget? child;
  const LoginFormContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        constraints: BoxConstraints.tightForFinite(width: 500),
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          color: Color(0xfffff7f7),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: child,
      ),
    );
  }
}
