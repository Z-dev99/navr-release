import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 24),
              ProfileScreenPersonalInfoAvatar(),
              ProfileScreenPersonalInfo(
                title: context.locale.languageCode == 'ru'
                    ? 'Данные профиля'
                    : 'Profil ma\'lumotlari',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreenPersonalInfoAvatar extends StatefulWidget {
  const ProfileScreenPersonalInfoAvatar({super.key});

  @override
  State<ProfileScreenPersonalInfoAvatar> createState() =>
      _ProfileScreenPersonalInfoAvatarState();
}

class _ProfileScreenPersonalInfoAvatarState
    extends State<ProfileScreenPersonalInfoAvatar> {
  File? _image;
  static const _imageKey = 'profile_image_path';

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString(_imageKey);
    if (path != null && File(path).existsSync()) {
      setState(() {
        _image = File(path);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_imageKey, imageFile.path);

      setState(() {
        _image = imageFile;
      });
    }
  }

  void _openFullScreen() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FullScreenImagePage(imageFile: _image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: _image != null ? _openFullScreen : _pickImage,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: const Color(0xff89A19F)),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade100,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? const Icon(Icons.person, color: Colors.grey, size: 32)
                    : null,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: _pickImage,
          child: Text(
            Localizations.localeOf(context).languageCode == "ru"
                ? 'Выбрать фото'
                : "Fotosuratni tanlang",
            style: const TextStyle(fontSize: 14, color: Color(0xff2158E8)),
          ),
        ),
      ],
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final File imageFile;

  const FullScreenImagePage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(child: InteractiveViewer(child: Image.file(imageFile))),
    );
  }
}

//
class ProfileScreenPersonalInfo extends StatefulWidget {
  final String title;

  const ProfileScreenPersonalInfo({super.key, required this.title});

  @override
  State<ProfileScreenPersonalInfo> createState() =>
      _ProfileScreenPersonalInfoState();
}

class _ProfileScreenPersonalInfoState extends State<ProfileScreenPersonalInfo> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user');

    if (userJson != null) {
      setState(() {
        userData = jsonDecode(userJson);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff430000),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ProfileScreenPersonalInfoItem(
            labelText: context.locale.languageCode == 'ru' ? 'Имя' : 'Ism',
            value: userData?['name'] ?? '',
          ),
          const SizedBox(height: 12),
          ProfileScreenPersonalInfoItem(
            labelText: context.locale.languageCode == 'ru' ? 'Почта' : 'Pochta',
            value: userData?['email'] ?? '',
          ),
          const SizedBox(height: 12),
          ProfileScreenPersonalInfoItem(
            labelText: context.locale.languageCode == 'ru'
                ? 'Номер телефона'
                : 'Telefon raqami',
            value: userData?['phone'] ?? '',
          ),

          const SizedBox(height: 12),
          ProfileScreenPersonalInfoItem(
            labelText: context.locale.languageCode == 'ru'
                ? 'Паспорт'
                : 'Pasport',
            value: userData?['passport'] ?? '',
          ),
          const SizedBox(height: 12),
          ProfileScreenPersonalInfoItem(
            labelText: context.locale.languageCode == 'ru' ? 'Пол' : 'Qavat',
            value: userData?['gender'] ?? '',
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () async {
              final GoogleSignIn _googleSignIn = GoogleSignIn(
                clientId: Platform.isAndroid
                    ? dotenv.env['GOOGLE_CLIENT_ID']
                    : Platform.isIOS
                    ? dotenv.env['GOOGLE_CLIENT_ID_IOS']
                    : dotenv.env['GOOGLE_CLIENT_ID_WEB'],
                serverClientId: dotenv.env['GOOGLE_SERVER_CLIENT_ID'],

                forceCodeForRefreshToken: true,
                scopes: ['email', 'openid'],
              );

              final pref = await SharedPreferences.getInstance();
              pref.clear();
              await _googleSignIn.signOut();
              context.router.replace(const SplashRoute());
            },
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(double.infinity, 52)),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            child: Text(
              context.locale.languageCode == 'ru' ? 'Выход' : 'Chiqish',
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 238, 24, 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
class ProfileScreenPersonalInfoItem extends StatelessWidget {
  final String labelText;
  final String value;

  const ProfileScreenPersonalInfoItem({
    super.key,
    required this.labelText,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xffc97f7f);
    const borderRadius = BorderRadius.all(Radius.circular(4));

    final outlineBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: borderColor),
    );

    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: value,
        hintStyle: const TextStyle(fontSize: 18, color: borderColor),
        labelStyle: const TextStyle(fontSize: 10, color: borderColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabled: false,
        enabledBorder: outlineBorder,
        focusedBorder: outlineBorder,
        errorBorder: outlineBorder,
        focusedErrorBorder: outlineBorder,
        disabledBorder: outlineBorder,
      ),
    );
  }
}
