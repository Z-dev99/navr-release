import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navr_app/features/main/widgets/main_screen_info.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),

            MainScreenInfo(
              items: <MainScreenInfoItemData>[
                MainScreenInfoItemData(
                  title: 'main.organizer_steps.step1.title'.tr(),
                  description: 'main.organizer_steps.step1.description'.tr(),
                  image: 'assets/icons/calendar-add.svg',
                ),
                MainScreenInfoItemData(
                  title: 'main.organizer_steps.step2.title'.tr(),
                  description: 'main.organizer_steps.step2.description'.tr(),
                  image: 'assets/icons/calendar-tick.svg',
                ),
                MainScreenInfoItemData(
                  title: 'main.organizer_steps.step3.title'.tr(),
                  description: 'main.organizer_steps.step3.description'.tr(),
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
