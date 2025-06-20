import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscureText;
  final String? errorText;

  const LoginTextField({
    super.key,
    required this.controller,
    this.label = '',
    this.hint = '',
    this.obscureText = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Color(0xffc97f7f)),
    );

    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: const Color(0xff430000),
      style: const TextStyle(fontSize: 16, color: Color(0xff430000)),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: errorText,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xff430000)),
        labelStyle: const TextStyle(fontSize: 10, color: Color(0xffc97f7f)),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
