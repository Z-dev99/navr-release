import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget? child;
  const Wrapper({super.key, this.child});

  @override
  Widget build(BuildContext context) =>
      SafeArea(top: true, child: child ?? SizedBox());
}
