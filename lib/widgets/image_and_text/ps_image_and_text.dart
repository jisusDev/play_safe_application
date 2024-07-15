import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';

class PSImageCenterAndText extends StatelessWidget {
  const PSImageCenterAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage(
            "assets/images/bro.png",
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              maxLines: 2,
              textAlign: TextAlign.center,
              "No hay jugadores activos actualmente",
              style: PsTextStyle.titleH1(PsAppcolor.primary),
            ),
          ),
        )
      ],
    );
  }
}
