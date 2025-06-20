// main_screen.dart

import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:navr_app/di.dart';
import 'package:navr_app/features/main/data/main_data_api_client.dart';
import 'package:navr_app/features/main/service/main_data_service.dart';
import 'package:navr_app/features/main/widgets/main_screen_events.dart';
import 'package:navr_app/features/main/widgets/main_screen_header.dart';
import 'package:navr_app/features/main/widgets/main_screen_info.dart';
import 'package:navr_app/features/main/widgets/main_screen_posters.dart';
import 'package:navr_app/widgets/footer.dart';
import 'package:navr_app/widgets/wrapper.dart';

Future<Map<String, dynamic>> fetchMainScreenData() async {
  return await sl<MainDataService>().getMainScreenData();
}

Future<EventsResponse> fetchFilteredEvents({
  required int page,
  String? categoryId,
  String? query,
}) async {
  return await sl<MainDataService>().getEvents(
    category: categoryId == "-1" ? null : categoryId,
    page: page,
    query: query,
  );
}

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<BannerModel> posters = [];
  List<CategoryModel> categories = [];
  EventsResponse? events;
  String? selectedCategoryId;
  bool isLoading = true;
  int currentPage = 1;
  int totalPages = 1;

  late TextEditingController searchController;
  String? searchQuery;
  Timer? _debounce;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    searchController = TextEditingController();
    searchController.addListener(_onSearchChanged);
    _loadMainData();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.removeListener(_onSearchChanged);
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchQuery = searchController.text.trim();
      _loadEvents(page: 1, categoryId: selectedCategoryId, search: searchQuery);
    });
  }

  Future<void> _loadMainData() async {
    setState(() => isLoading = true);
    final data = await fetchMainScreenData();
    final fetchedCategories = data['categories'] as List<CategoryModel>;
    final allCategory = CategoryModel(id: -1, name: "Все", nameUz: 'Hammasi');
    final eventsResponse = data['events'] as EventsResponse;

    if (mounted) {
      setState(() {
        posters = data['posters'] as List<BannerModel>;
        categories = [allCategory, ...fetchedCategories];
        events = eventsResponse;
        selectedCategoryId = "-1";
        currentPage = 1;
        totalPages = (eventsResponse.count / 21).ceil();
        isLoading = false;
      });
    }
  }

  Future<void> _loadEvents({
    required int page,
    String? categoryId,
    String? search,
  }) async {
    setState(() => isLoading = true);

    final filteredEvents = await fetchFilteredEvents(
      page: page,
      categoryId: categoryId,
      query: search,
    );

    setState(() {
      events = filteredEvents;
      currentPage = page;
      totalPages = (filteredEvents.count / 21).ceil();
      isLoading = false;
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> _onCategorySelected(String? categoryId) async {
    selectedCategoryId = categoryId;
    await _loadEvents(page: 1, categoryId: categoryId, search: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && (events == null || categories.isEmpty)) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xff610808)),
        ),
      );
    }
    context.locale;

    return Scaffold(
      body: Wrapper(
        child: Column(
          children: <Widget>[
            MainScreenHeader(
              categories: categories,
              selectedCategoryId: selectedCategoryId,
              onCategorySelected: _onCategorySelected,
              controller: searchController,
            ),
            Expanded(
              child: RefreshIndicator(
                color: Color(0xffc97f7f),
                backgroundColor: Colors.white,
                onRefresh: _loadMainData,
                child: ListView(
                  controller: scrollController,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    MainScreenPosters(banners: posters),
                    const SizedBox(height: 16),
                    if (events != null) MainScreenEvents(events: events!),
                    PaginationWidget(
                      currentPage: currentPage,
                      totalPages: totalPages,
                      onPageChanged: (int newPage) {
                        _loadEvents(
                          page: newPage,
                          categoryId: selectedCategoryId,
                          search: searchQuery,
                        );
                      },
                    ),
                    MainScreenInfo(
                      items: <MainScreenInfoItemData>[
                        MainScreenInfoItemData(
                          title: 'main.organizer_steps.step1.title'.tr(),
                          description: 'main.organizer_steps.step1.description'
                              .tr(),
                          image: 'assets/icons/calendar-add.svg',
                        ),
                        MainScreenInfoItemData(
                          title: 'main.organizer_steps.step2.title'.tr(),
                          description: 'main.organizer_steps.step2.description'
                              .tr(),
                          image: 'assets/icons/calendar-tick.svg',
                        ),
                        MainScreenInfoItemData(
                          title: 'main.organizer_steps.step3.title'.tr(),
                          description: 'main.organizer_steps.step3.description'
                              .tr(),
                          image: 'assets/icons/wallet.svg',
                        ),
                      ],
                    ),
                    MainScreenInfo(
                      items: <MainScreenInfoItemData>[
                        MainScreenInfoItemData(
                          title: 'main.user_steps.step1.title'.tr(),
                          description: 'main.user_steps.step1.description'.tr(),
                          image: 'assets/icons/calendar-add.svg',
                        ),
                        MainScreenInfoItemData(
                          title: 'main.user_steps.step2.title'.tr(),
                          description: 'main.user_steps.step2.description'.tr(),
                          image: 'assets/icons/ticket.svg',
                        ),
                        MainScreenInfoItemData(
                          title: 'main.user_steps.step3.title'.tr(),
                          description: 'main.user_steps.step3.description'.tr(),
                          image: 'assets/icons/wallet.svg',
                        ),
                      ],
                    ),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final void Function(int page)? onPageChanged;

  const PaginationWidget({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages < 1) return const SizedBox();

    const maxVisiblePages = 5;
    int start = currentPage - (maxVisiblePages ~/ 2);
    int end = currentPage + (maxVisiblePages ~/ 2);

    if (start < 1) {
      end += 1 - start;
      start = 1;
    }

    if (end > totalPages) {
      start -= end - totalPages;
      end = totalPages;
    }

    start = start.clamp(1, totalPages);
    end = end.clamp(1, totalPages);

    final gradient = const LinearGradient(
      colors: [Color(0xffEA4747), Color(0xff4D0808)],
    );

    List<Widget> pageButtons = [];
    for (int i = start; i <= end; i++) {
      final isActive = i == currentPage;
      pageButtons.add(
        GestureDetector(
          onTap: isActive ? null : () => onPageChanged?.call(i),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : Colors.transparent,
              border: isActive
                  ? GradientBoxBorder(gradient: gradient, width: 2)
                  : null,
            ),
            alignment: Alignment.center,
            child: Text(
              '$i',
              style: TextStyle(
                color: isActive ? const Color(0xff610808) : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
    }

    return Wrap(alignment: WrapAlignment.center, children: pageButtons);
  }
}
