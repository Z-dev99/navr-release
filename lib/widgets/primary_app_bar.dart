import 'package:auto_route/auto_route.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool withMargin;
  final bool showButton;
  const PrimaryAppBar({
    super.key,
    this.withMargin = false,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: PrimaryAppBarLogo(),
      backgroundColor: Color(0xffa10000),
      actions: <Widget>[
        if (showButton) PrimaryAppBarLanguage(withMargin: withMargin),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64);
}

class PrimaryAppBarLogo extends StatelessWidget {
  const PrimaryAppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/logo.svg',
          color: Colors.white,
          width: 62,
        ),
        SizedBox(width: 14),
        Text(
          'NAVR.uz',
          style: TextStyle(
            fontFamily: 'KleeOne',
            fontSize: 25,
            height: .6,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class PrimaryAppBarLanguage extends StatelessWidget {
  final bool withMargin;
  const PrimaryAppBarLanguage({super.key, required this.withMargin});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          useSafeArea: true,
          constraints: BoxConstraints(maxHeight: 200),
          backgroundColor: Colors.transparent,
          builder: (context) {
            return PrimaryAppBarLanguagePicker(withMargin: withMargin);
          },
        );
      },
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(4)),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        elevation: WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(Color.fromARGB(6, 67, 0, 0)),
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons/nav/lang.svg',
            color: Colors.white,
            width: 18,
            height: 18,
          ),
          SizedBox(width: 8),
          Text(
            context.locale.languageCode == 'ru' ? 'Русский' : 'O\'zbek',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Icon(Icons.arrow_drop_down_rounded, color: Colors.white),
        ],
      ),
    );
  }
}

class PrimaryAppBarLanguagePicker extends StatelessWidget {
  final bool withMargin;
  const PrimaryAppBarLanguagePicker({super.key, required this.withMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: withMargin ? EdgeInsets.all(16) : null,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffFFF7F7),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 34,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0xff430000),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          SizedBox(height: 28),
          PrimaryAppBarLanguagePickerItem(countryCode: 'ru'),
          SizedBox(height: 12),
          PrimaryAppBarLanguagePickerItem(countryCode: 'uz'),
        ],
      ),
    );
  }
}

class PrimaryAppBarLanguagePickerItem extends StatefulWidget {
  final String countryCode;

  const PrimaryAppBarLanguagePickerItem({super.key, this.countryCode = 'ru'});

  @override
  State<PrimaryAppBarLanguagePickerItem> createState() =>
      _PrimaryAppBarLanguagePickerItemState();
}

class _PrimaryAppBarLanguagePickerItemState
    extends State<PrimaryAppBarLanguagePickerItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            context.setLocale(Locale(widget.countryCode));
            context.router.pop();
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: <Widget>[
              CountryFlag.fromCountryCode(
                widget.countryCode,
                shape: RoundedRectangle(10),
                width: 48,
                height: 40,
              ),
              SizedBox(width: 32),
              Text(
                widget.countryCode == 'ru' ? 'Русский' : 'O\'zbek',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff430000),
                  fontFamily: 'Raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
