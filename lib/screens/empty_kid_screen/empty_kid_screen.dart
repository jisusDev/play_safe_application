import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/elevated_button/ps_add_timer_button.dart';
import 'package:play_safe_application/widgets/image_and_text/ps_image_and_text.dart';

class EmptyKidScreen extends StatelessWidget {
  const EmptyKidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: SafeArea(child: _Body()),
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
                    image: AssetImage("assets/images/wave.png"),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
              PSAddTimerButton(
                icon: Icons.alarm_add,
                onPressed: () {},
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
