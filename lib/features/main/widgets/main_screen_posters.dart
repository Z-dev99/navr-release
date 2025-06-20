import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';

class MainScreenPosters extends StatefulWidget {
  final List<BannerModel> banners;

  const MainScreenPosters({super.key, required this.banners});

  @override
  State<MainScreenPosters> createState() => _MainScreenPostersState();
}

class _MainScreenPostersState extends State<MainScreenPosters> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, _) =>
              MainScreenPostersItem(img: widget.banners[index].image),
          options: CarouselOptions(
            height: 120,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        MainScreenPostersIndicators(
          currentIndex: _currentIndex,
          itemCount: widget.banners.length,
        ),
      ],
    );
  }
}
class MainScreenPostersItem extends StatelessWidget {
  final String img;
  const MainScreenPostersItem({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        color: const Color.fromARGB(55, 158, 158, 158),
        child: FastCachedImage(
          url: img,
          fit: BoxFit.cover,
          width: double.infinity,
          loadingBuilder: (_, __) => const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Color.fromARGB(255, 70, 34, 34),
            ),
          ),
          errorBuilder: (_, __, ___) => const Center(
            child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class MainScreenPostersIndicators extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const MainScreenPostersIndicators({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 295,
      decoration: BoxDecoration(
        color: const Color(0xffffcfcf),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(itemCount, (index) {
          final isActive = index == currentIndex;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 6,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF5c0000)
                    : const Color(0xFFFFCFCF),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          );
        }),
      ),
    );
  }
}
