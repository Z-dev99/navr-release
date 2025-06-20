import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: FooterConstants.verticalPadding,
      ),
      decoration: const BoxDecoration(color: FooterConstants.backgroundColor),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(FooterAssets.logoPath, color: Colors.white),
              const SizedBox(width: FooterConstants.logoSpacing),
              Text(
                FooterTexts.brand,
                style: const TextStyle(
                  fontSize: FooterConstants.brandFontSize,
                  color: Colors.white,
                  fontFamily: FooterTexts.brandFont,
                ),
              ),
            ],
          ),
          const SizedBox(height: FooterConstants.textSpacing),
          const Text(
            FooterTexts.copyright,
            style: TextStyle(
              color: FooterConstants.secondaryTextColor,
              fontFamily: FooterTexts.bodyFont,
            ),
          ),
        ],
      ),
    );
  }
}

class FooterConstants {
  static const double verticalPadding = 60;
  static const double logoSpacing = 16;
  static const double textSpacing = 16;
  static const double brandFontSize = 26;

  static const Color backgroundColor = Color(0xffa10000);
  static const Color secondaryTextColor = Color.fromRGBO(255, 255, 255, 0.8);
}

class FooterAssets {
  static const String logoPath = 'assets/icons/logo.svg';
}

class FooterTexts {
  static const String brand = 'NAVR.uz';
  static const String copyright = '© 2025 NAVR.uz. All rights reserved.';
  static const String brandFont = 'KleeOne';
  static const String bodyFont = 'Inter';
}
