import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

enum CarouselItemTypes { restaraunt, event }

class MainScreenEvents extends StatelessWidget {
  final EventsResponse events;
  const MainScreenEvents({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        mainAxisExtent: 330,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) =>
          MainScreenCarouselWidgetItem(event: events.results[index]),
      itemCount: events.results.length,
    );
  }
}

class MainScreenCarouselWidgetItem extends StatelessWidget {
  final double imageHeight;
  final double widgetWidth;
  final CarouselItemTypes type;
  final Event event;

  const MainScreenCarouselWidgetItem({
    super.key,
    this.imageHeight = 108,
    this.widgetWidth = 196,
    required this.event,
    this.type = CarouselItemTypes.event,
  });

  @override
  Widget build(BuildContext context) {
    context.locale;
    return ZoomTapAnimation(
      begin: 1,
      end: .98,
      onTap: () => context.pushRoute(DetailRoute(eventData: event)),
      child: SizedBox(
        width: widgetWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageCard(
              url:
                  event.pictureBanner ??
                  event.pictureAvatar ??
                  event.pictureBuklet ??
                  '',
              height: imageHeight,
            ),
            const SizedBox(height: 8),
            Text(
              context.locale.languageCode == 'uz'
                  ? event.name_uz ?? 'Xato'
                  : event.name ?? 'Ошибка',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff430000),
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (type != CarouselItemTypes.restaraunt)
              Text(
                formatEventDate(event.beginDate, context),
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xffc97f7f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (type == CarouselItemTypes.restaraunt)
              const Text(
                '​Ресторан корейской кухни',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xffc97f7f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (type == CarouselItemTypes.restaraunt)
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 4.5,
                    itemCount: 5,
                    itemSize: 12,
                    direction: Axis.horizontal,
                    itemBuilder: (_, __) =>
                        const Icon(Icons.star, color: Color(0xff430000)),
                    unratedColor: const Color(0xffc97f7f),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    '4.5',
                    style: TextStyle(fontSize: 14, color: Color(0xff430000)),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    '6 оценок',
                    style: TextStyle(fontSize: 14, color: Color(0xffc97f7f)),
                  ),
                ],
              ),
            if (type != CarouselItemTypes.restaraunt)
              Text(
                event.minPrice == null || event.maxPrice == null
                    ? context.locale.languageCode == 'ru'
                          ? 'Нет информации'
                          : 'Ma\'lumot yo\'q'
                    : '${event.minPrice} - ${event.maxPrice} ${event.currency ?? (context.locale.languageCode == 'ru' ? 'Нет данных' : 'Maʼlumot yoʻq')} ',
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xffc97f7f),
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 8),
            _LocationRow(
              location: context.locale.languageCode == 'ru'
                  ? event.palace_address_ru ?? 'Нет информации'
                  : event.palace_address_uz ?? 'Maʼlumot yoʻq',
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String url;
  final double height;

  const _ImageCard({required this.url, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: FastCachedImage(
        key: UniqueKey(),
        url: url,
        height: 220,
        fadeInDuration: Duration(milliseconds: 100),
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (_, __) => SizedBox(height: 220),
        errorBuilder: (_, __, ___) => Center(
          child: Container(
            width: double.infinity,
            height: 220,
            color: Colors.grey.shade100,
            child: Icon(Icons.broken_image, size: 40, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  final String location;
  const _LocationRow({required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/location.svg'),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 10, color: Color(0xff430000)),
          ),
        ),
      ],
    );
  }
}

String formatEventDate(String? rawDate, BuildContext context) {
  if (rawDate == null || rawDate.trim().isEmpty) {
    return context.locale.languageCode == 'ru'
        ? 'Нет информации'
        : 'Ma\'lumot yo\'q';
  }

  try {
    DateTime date = DateTime.parse(rawDate).toLocal();

    final localeString = context.locale.toString();
    final weekDayFormat = DateFormat.EEEE(localeString);
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm', localeString);

    String weekDay =
        toBeginningOfSentenceCase(weekDayFormat.format(date)) ?? '';
    String formattedDate = dateFormat.format(date);

    return '$weekDay $formattedDate';
  } catch (e) {
    return context.locale.languageCode == 'ru'
        ? 'Нет информации'
        : 'Ma\'lumot yo\'q';
  }
}
