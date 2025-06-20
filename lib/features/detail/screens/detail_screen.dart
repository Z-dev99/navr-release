import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navr_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/features/theaters/data/theaters_api_client.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:navr_app/widgets/footer.dart';
import 'package:navr_app/widgets/primary_app_bar.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  final dynamic eventData;
  const DetailScreen({super.key, required this.eventData});

  @override
  Widget build(BuildContext context) {
    final event = eventData is Event
        ? eventData
        : eventData is Theaters
        ? eventData
        : Event();
    context.locale;
    return Scaffold(
      bottomNavigationBar: DetailScreenBottomBar(),
      appBar: PrimaryAppBar(showButton: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 54,
        width: 54,
        child: FloatingActionButton(
          onPressed: () => context.router.replace(const MainRoute()),
          elevation: 0,
          highlightElevation: 0,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset('assets/icons/logo.svg', width: 40),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              DetailScreenHeader(
                eventName: context.locale.languageCode == "ru"
                    ? event.name ?? 'Error'
                    : event.name_uz ?? '',
              ),
              SizedBox(height: 20),
              DetailScreenPoster(url: event.pictureBanner ?? ''),
              SizedBox(height: 20),
              // DetailScreenRating(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.locale.languageCode == 'ru'
                          ? 'Описание'
                          : 'Tavsif',
                      style: TextStyle(fontSize: 16, color: Color(0xff430000)),
                    ),
                    SizedBox(height: 12),
                    Divider(height: 2, color: Color(0xff430000)),
                    ExpandableWidget(
                      expandText: context.locale.countryCode == 'ru'
                          ? 'Подробнее...'
                          : 'Ko\'proq o\'qish...',
                      collapseText: context.locale.countryCode == 'ru'
                          ? 'Скрыть'
                          : 'Yashirish',
                      child: HtmlDescription(
                        htmlContent: context.locale.languageCode == "ru"
                            ? event.content ?? ''
                            : event.content_uz ?? '',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(event.session.length!, (index) {
                return DetailScreenSessions(
                  session: event.session[index],
                  event: event,
                );
              }),
              SizedBox(height: 20),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class HtmlDescription extends StatelessWidget {
  final String htmlContent;

  const HtmlDescription({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlContent,
      style: {
        "p": Style(
          fontSize: FontSize(16),
          lineHeight: LineHeight.number(1.2),
          color: Color(0xffc97f7f),
        ),
      },
    );
  }
}

class DetailScreenHeader extends StatelessWidget {
  final String eventName;
  const DetailScreenHeader({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.pop(),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SvgPicture.string(
              '''<svg width="18" height="19" viewBox="0 0 18 19" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M7.17749 4.94727L2.62499 9.49977L7.17749 14.0523" stroke="#430000" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
      <path opacity="0.4" d="M15.375 9.5H2.7525" stroke="#C97F7F" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round" />
    </svg>''',
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                eventName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff430000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreenPoster extends StatelessWidget {
  final String url;
  const DetailScreenPoster({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        child: SizedBox(
          height: 240,
          child: FastCachedImage(
            key: UniqueKey(),
            url: url,
            fadeInDuration: Duration(milliseconds: 100),
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (_, __) => SizedBox(height: 220),
            errorBuilder: (_, __, ___) => Center(
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade100,
                child: Icon(Icons.broken_image, size: 40, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreenRating extends StatelessWidget {
  const DetailScreenRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          DetailScreenRatingItem(
            title: 'Humo Arena: ',
            rating: '4.9',
            reviews: '123',
          ),
          DetailScreenRatingItem(
            title: 'Концерт:',
            rating: '4.9',
            reviews: '524',
          ),
          DetailScreenRatingItem(
            title: 'Севара Назархан:',
            rating: '4.9',
            reviews: '524',
          ),
        ],
      ),
    );
  }
}

class DetailScreenRatingItem extends StatelessWidget {
  final String title;
  final String rating;
  final String reviews;
  const DetailScreenRatingItem({
    super.key,
    this.title = 'Humo Arena: ',
    this.rating = '4.5',
    this.reviews = '124',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          maxLines: 1,
          style: TextStyle(fontSize: 16, color: Color(0xffc97f7f)),
        ),
        SizedBox(width: 12),
        RatingBarIndicator(
          rating: 4.5,
          itemCount: 5,
          itemSize: 14,
          direction: Axis.horizontal,
          itemBuilder: (_, __) =>
              const Icon(Icons.star, color: Color(0xff430000)),
          unratedColor: const Color(0xffc97f7f),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            rating,
            style: const TextStyle(fontSize: 14, color: Color(0xff430000)),
          ),
        ),
        const SizedBox(width: 14),
        Text(
          '$reviews оценок',
          maxLines: 1,
          style: const TextStyle(fontSize: 12, color: Color(0xffc97f7f)),
        ),
      ],
    );
  }
}

class ExpandableWidget extends StatefulWidget {
  final Widget child;
  final int collapsedLines;
  final String expandText;
  final String collapseText;

  const ExpandableWidget({
    super.key,
    required this.child,
    this.collapsedLines = 14,
    this.expandText = 'Подробнее...',
    this.collapseText = 'Скрыть',
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ConstrainedBox(
            constraints: _expanded
                ? const BoxConstraints()
                : BoxConstraints(maxHeight: 20.0 * widget.collapsedLines),
            child: ClipRect(child: widget.child),
          ),
        ),
        GestureDetector(
          onTap: _toggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              _expanded ? widget.collapseText : widget.expandText,
              style: TextStyle(color: Color(0xff610808), fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailScreenSessions extends StatefulWidget {
  final dynamic session;
  final dynamic event;

  const DetailScreenSessions({
    super.key,
    required this.session,
    required this.event,
  });

  @override
  State<DetailScreenSessions> createState() => _DetailScreenSessionsState();
}

class _DetailScreenSessionsState extends State<DetailScreenSessions>
    with TickerProviderStateMixin {
  bool _isMapVisible = false;

  void _toggleMapVisibility() {
    setState(() {
      _isMapVisible = !_isMapVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleMapVisibility,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Color(0xffFFECEC)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xffFFF7F7),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DetailScreenSessionsItem(date: widget.session['beginDate']),
              const SizedBox(height: 8),
              Text(
                context.locale.languageCode == 'ru' ? 'Сеанс:' : 'Sessiya:',
                style: TextStyle(fontSize: 16, color: Color(0xffc97f7f)),
              ),
              Text(
                widget.session['sessionName'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffc97f7f),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                context.locale.languageCode == 'ru' ? 'Цена:' : 'Narxi:',
                style: TextStyle(fontSize: 16, color: Color(0xffc97f7f)),
              ),
              Text(
                widget.event.minPrice == null || widget.event.maxPrice == null
                    ? context.locale.languageCode == 'ru'
                          ? 'Нет информации'
                          : 'Ma\'lumot yo\'q'
                    : '${widget.event.minPrice} - ${widget.event.maxPrice} ${widget.event.currency ?? (context.locale.languageCode == 'ru' ? 'Нет данных' : 'Maʼlumot yoʻq')} ',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffc97f7f),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: _isMapVisible
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset('assets/icons/map.png'),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreenSessionsItem extends StatelessWidget {
  final String date;
  const DetailScreenSessionsItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Text(
              context.locale.languageCode == 'ru' ? 'Дата:' : 'Sana:',
              style: TextStyle(fontSize: 16, color: Color(0xffc97f7f)),
            ),
          ],
        ),
        SizedBox(
          width: 310,
          child: Text(
            formatEventDate(date, context),
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff430000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class DetailScreenCommentsBlock extends StatelessWidget {
  const DetailScreenCommentsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        children: <Widget>[
          DetailScreenCommentsBlockItem(),
          SizedBox(height: 8),
          DetailScreenCommentsBlockItem(),
          SizedBox(height: 8),
          DetailScreenCommentsBlockItem(),
          SizedBox(height: 8),
          DetailScreenCommentsBlockItem(),
        ],
      ),
    );
  }
}

class DetailScreenCommentsBlockItem extends StatelessWidget {
  const DetailScreenCommentsBlockItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xfffff7f7),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Екатерина',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff430000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12 мая 2024',
                    style: TextStyle(fontSize: 14, color: Color(0xffc97f7f)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DetailScreenRatingItem(
                title: 'Humo Arena: ',
                rating: '4.9',
                reviews: '123',
              ),
              DetailScreenRatingItem(
                title: 'Концерт:',
                rating: '4.9',
                reviews: '524',
              ),
              DetailScreenRatingItem(
                title: 'Севара Назархан:',
                rating: '4.9',
                reviews: '524',
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Комментарий',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff430000),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Концерт был просто невероятным! Атмосфера, звук и энергия артистов — всё на высшем уровне. До сих пор мурашки!',
            style: TextStyle(fontSize: 14, color: Color(0xffc97f7f)),
          ),
        ],
      ),
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

class DetailScreenBottomBar extends StatelessWidget {
  const DetailScreenBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 74,
      notchMargin: 4,
      shape: ReverseNotchShape(),
      color: Color(0xffa10000),
      child: Container(
        padding: EdgeInsets.only(top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            navItem('theathers', 0, context),
            navItem('lang', -1, context),
            SizedBox(width: 80),
            navItem('profile', 2, context),
          ],
        ),
      ),
    );
  }

  Widget navItem(String icon, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index != -1) {
          if (index == 0) {
            context.router.replace(TheatersRoute());
          } else if (index == 2) {
            context.router.replace(ProfileRoute());
          }
        } else {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            constraints: BoxConstraints(maxHeight: 200),
            backgroundColor: Colors.transparent,
            builder: (context) {
              return PrimaryAppBarLanguagePicker(withMargin: false);
            },
          );
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xffa10000),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/nav/$icon.svg',
          color: Colors.white,
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
