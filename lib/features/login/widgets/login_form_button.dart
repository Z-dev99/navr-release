import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class LoginFormButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const LoginFormButton({super.key, this.text = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(6);
    final gradient = LinearGradient(
      colors: [Color(0xffEA4747), Color(0xff4D0808)],
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 321,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: borderRadius,
          border: GradientBoxBorder(gradient: gradient),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(3, 4),
            ),
          ],
        ),
        child: AutoSizeText(
          text,
          maxLines: 1,
          minFontSize: 12,
          maxFontSize: 14,
          style: TextStyle(color: Color(0xff430000), fontFamily: 'Raleway'),
        ),
      ),
    );
  }
}
