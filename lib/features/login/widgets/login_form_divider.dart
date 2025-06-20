import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginFormDivider extends StatelessWidget {
  const LoginFormDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerColor = Color(0xffc97f7f);
    const dividerIndent = 14.0;
    const verticalPadding = 28.0;
    context.locale;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: verticalPadding),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: dividerColor,
              thickness: 1,
              endIndent: dividerIndent,
            ),
          ),
          Text(
            tr('login.or'),
            style: const TextStyle(fontSize: 14, color: Color(0xff430000)),
          ),
          const Expanded(
            child: Divider(
              color: dividerColor,
              thickness: 1,
              indent: dividerIndent,
            ),
          ),
        ],
      ),
    );
  }
}
