import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:navr_app/routes.gr.dart';
import 'package:navr_app/widgets/primary_app_bar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: true,
      inheritNavigatorObservers: true,
      routes: <PageRouteInfo<Object?>>[
        TheatersRoute(),
        MainRoute(),
        InfoRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PrimaryAppBar(showButton: false),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: 54,
            width: 54,
            child: FloatingActionButton(
              onPressed: () => tabsRouter.setActiveIndex(1),
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: SvgPicture.asset('assets/icons/logo.svg', width: 40),
            ),
          ),
          bottomNavigationBar: DashboardScreenBottomBar(tabsRouter: tabsRouter),
          body: child,
        );
      },
    );
  }
}

class DashboardScreenBottomBar extends StatelessWidget {
  final TabsRouter tabsRouter;
  const DashboardScreenBottomBar({super.key, required this.tabsRouter});

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
            navItem('info', 2, context),
            navItem('profile', 3, context),
          ],
        ),
      ),
    );
  }

  Widget navItem(String icon, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index != -1) {
          tabsRouter.setActiveIndex(index);
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
          color: index == tabsRouter.activeIndex
              ? Colors.white
              : Color(0xffa10000),
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/nav/$icon.svg',
          color: index == tabsRouter.activeIndex
              ? Color(0xffa10000)
              : Colors.white,
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}

class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;
  NavModel({required this.page, required this.navKey});
}

class ReverseNotchShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final double notchRadius = guest!.width / 2.0;
    const double s1 = 20.0;
    const double s2 = 18.0;
    const double cornerRadius = 0;

    final r = notchRadius;
    final a = -1.0 * r - s2;
    final b = host.top;
    final e = guest.center.dx;

    final path = Path();

    path.moveTo(host.left, b + cornerRadius);
    path.quadraticBezierTo(host.left, b, host.left + cornerRadius, b);

    path.lineTo(e + a - s1, b);

    path.quadraticBezierTo(e + a, b, e + a + s1, b - s1);
    path.quadraticBezierTo(e, b - notchRadius * 1.5, e - a - s1, b - s1);
    path.quadraticBezierTo(e - a, b, e - a + s1, b);

    path.lineTo(host.right - cornerRadius, b);

    path.quadraticBezierTo(host.right, b, host.right, b + cornerRadius);

    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    super.key,
    this.blur = 10,
    this.color = Colors.black38,
    this.offset = const Offset(10, 10),
    required Widget super.child,
  });

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final RenderInnerShadow renderObject = RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderInnerShadow renderObject,
  ) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class RenderInnerShadow extends RenderProxyBox {
  double blur = 0.0;
  Color color = Color.fromRGBO(0, 0, 0, .25);
  double dx = 0.0;
  double dy = 0.0;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx,
      size.height - dy,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur)
      ..colorFilter = ColorFilter.mode(color, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx, dy);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
