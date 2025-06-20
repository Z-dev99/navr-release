import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreenInfoItemData {
  final String title;
  final String description;
  final String image;

  const MainScreenInfoItemData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class MainScreenInfoRepository {
  static List<MainScreenInfoItemData> getClientItems() => const [
    MainScreenInfoItemData(
      title: 'Выбираете услугу',
      description: 'Выбираете нужное мероприятие из списка.',
      image: 'assets/icons/client1.svg',
    ),
    MainScreenInfoItemData(
      title: 'Оплачиваете онлайн',
      description: 'Платите удобно через приложение.',
      image: 'assets/icons/client2.svg',
    ),
    MainScreenInfoItemData(
      title: 'Получаете подтверждение',
      description: 'Моментально получаете подтверждение и билет.',
      image: 'assets/icons/client3.svg',
    ),
  ];

  static List<MainScreenInfoItemData> getOrganizerItems() => const [
    MainScreenInfoItemData(
      title: 'Создаёте мероприятие',
      description: 'Настраиваете и публикуете ваше событие.',
      image: 'assets/icons/org1.svg',
    ),
    MainScreenInfoItemData(
      title: 'Принимаете заявки',
      description: 'Управляете регистрациями и продажами.',
      image: 'assets/icons/org2.svg',
    ),
    MainScreenInfoItemData(
      title: 'Отчёты и аналитика',
      description: 'Получаете подробную статистику по мероприятию.',
      image: 'assets/icons/org3.svg',
    ),
  ];
}

class MainScreenInfo extends StatelessWidget {
  final bool forTheClient;
  final List<MainScreenInfoItemData> items;

  const MainScreenInfo({
    super.key,
    this.forTheClient = false,
    required this.items,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
      color: forTheClient ? const Color(0xfff2e3e3) : Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'main.howItWorks'.tr(),
          style: TextStyle(fontSize: 12, color: Color(0xffc97f7f)),
        ),
        const SizedBox(height: 4),
        Text(
          forTheClient ? 'main.forClient'.tr() : 'main.forOrganizer'.tr(),
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xff430000),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MainScreenInfoItem(
              data: item,
              isLast: index == items.length - 1,
            ),
          );
        }),
      ],
    ),
  );
}

class MainScreenInfoItem extends StatelessWidget {
  final MainScreenInfoItemData data;
  final bool isLast;

  const MainScreenInfoItem({
    super.key,
    required this.data,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainScreenInfoItemImage(image: data.image),
        const SizedBox(height: 12),
        Text(
          data.title,
          style: const TextStyle(fontSize: 16, color: Color(0xff430000)),
        ),
        const SizedBox(height: 8),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Color(0xffc97f7f)),
        ),
        if (!isLast) ...[
          const SizedBox(height: 12),
          SvgPicture.asset('assets/icons/arrow-down.svg'),
        ],
      ],
    );
  }
}

class MainScreenInfoItemImage extends StatelessWidget {
  final String image;

  const MainScreenInfoItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) => Container(
    width: 102,
    height: 102,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(
        width: 2,
        color: const Color.fromRGBO(110, 14, 14, .25),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(102)),
    ),
    alignment: Alignment.center,
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(80)),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .08),
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(image),
    ),
  );
}
