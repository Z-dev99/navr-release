import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navr_app/routes.dart';
import 'package:navr_app/routes.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final _authCheckUseCase = AuthCheckUseCase(SharedPrefsAuthRepository());

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _handleStartup();
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  Future<void> _handleStartup() async {
    final isAuthenticated = await _authCheckUseCase.execute();

    if (!mounted) return;

    await Future.delayed(const Duration(milliseconds: 1600));

    if (!mounted) return;

    setState(() => _isLoading = false);

    context.router.replace(
      isAuthenticated ? const DashboardRoute() : const LoginRoute(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 4,
            child: _isLoading
                ? const LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: Color(0xffA10000),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _opacityAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: 140,
                  height: 140,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
