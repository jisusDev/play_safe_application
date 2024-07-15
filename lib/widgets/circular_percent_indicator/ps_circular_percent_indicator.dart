import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';

class PSCircularPercentIndicator extends StatelessWidget {
  final double progressPercent;
  final String? numberMinutes;
  const PSCircularPercentIndicator({
    super.key,
    required this.progressPercent,
    this.numberMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 35,
      lineWidth: 6.0,
      percent: progressPercent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numberMinutes ?? "error numberMinutes",
            style: PsTextStyle.titleH1(PsAppcolor.primary)
          ),
          Text(
            "mins",
            style: PsTextStyle.smallRegular(PsAppcolor.black)
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      progressColor: PsAppcolor.secundary,
      backgroundColor: Colors.grey.shade200,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
