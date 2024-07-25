import 'package:flutter/material.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/elements.dart';

class PSEmptyKid extends StatelessWidget {
  const PSEmptyKid({super.key});

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
                  SizedBox(height: 40),
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
              const SizedBox(width: 30),
            ],
          )
        ],
      ),
    );
  }
}
