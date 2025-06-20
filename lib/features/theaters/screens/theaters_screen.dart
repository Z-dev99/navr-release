import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/di.dart';
import 'package:navr_app/features/main/screens/main_screen.dart';
import 'package:navr_app/features/theaters/data/theaters_api_client.dart';
import 'package:navr_app/features/theaters/service/theaters_service.dart';
import 'package:navr_app/features/theaters/widgets/theaters_screen_events.dart';
import 'package:navr_app/widgets/footer.dart';

@RoutePage()
class TheatersScreen extends StatefulWidget {
  const TheatersScreen({super.key});

  @override
  State<TheatersScreen> createState() => _TheatersScreenState();
}

class _TheatersScreenState extends State<TheatersScreen> {
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoading = true;
  TheatersResponse? _events;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    final result = await sl<TheatersService>().getMainScreenData(
      page: _currentPage,
    );

    final events = result['events'] as TheatersResponse;
    setState(() {
      _events = events;
      _totalPages = (events.count / 21).ceil();
      _isLoading = false;
    });
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Color(0xff610808)),
        ),
      );
    }

    if (_events == null) {
      return const Scaffold(
        body: Center(child: Text('Ошибка загрузки данных')),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            TheatersScreenEvents(events: _events!),
            PaginationWidget(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: _onPageChanged,
            ),
            SizedBox(height: 140),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
