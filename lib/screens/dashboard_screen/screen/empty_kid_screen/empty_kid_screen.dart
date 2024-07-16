import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/bottom_sheet_add_player_element.dart';
import 'package:play_safe_application/widgets/elevated_button/ps_add_timer_button.dart';
import 'package:play_safe_application/widgets/image_and_text/ps_image_and_text.dart';

class EmptyKidScreen extends StatelessWidget {
  const EmptyKidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PsAppcolor.background,
      body: SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const PSImageCenterAndText(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                children: [
                  Image(
                    height: 105,
                    image: AssetImage(
                      "assets/images/wave.png",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
              PSAddTimerButton(
                icon: Icons.alarm_add,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    barrierColor: PsAppcolor.black.withOpacity(0.25),
                    isDismissible: true,
                    isScrollControlled: true,
                    builder: (context) => const BottomSheetAddPlayerElement(),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
