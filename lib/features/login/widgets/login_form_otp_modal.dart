import 'package:flutter/material.dart';
import 'package:navr_app/features/login/widgets/login_form_button.dart';
import 'package:navr_app/widgets/login/login_text_field.dart';

class LoginFormOtpModal extends StatelessWidget {
  const LoginFormOtpModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '6-значное число было отправлено на ваш номер:',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xff430000),
          fontFamily: 'Inter',
        ),
      ),
      backgroundColor: Color(0xfffff7f7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      titlePadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          LoginTextField(
            controller: TextEditingController(),
            label: 'Введите код из СМС',
          ),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(4)),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            child: Text(
              'Отправить ещё раз СМС',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Inter',
                color: Color(0xff297ee8),
              ),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      scrollable: false,
      actionsPadding: EdgeInsets.only(bottom: 12, left: 20, right: 20),
      actions: [LoginFormButton(text: 'Отправить', onPressed: () {})],
    );
  }
}
