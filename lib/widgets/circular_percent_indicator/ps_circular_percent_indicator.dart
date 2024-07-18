import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:play_safe_application/config/config.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: CircularPercentIndicator(
        radius: 42,
        lineWidth: 6.0,
        percent: progressPercent,
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Text(
              numberMinutes ?? "error numberMinutes",
              style: PsTextStyle.titleH1(PsAppcolor.primary),
            ),
            Text(
              "mins",
              style: PsTextStyle.smallRegular(PsAppcolor.black),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        progressColor: PsAppcolor.secundary,
        backgroundColor: Colors.grey.shade200,
        circularStrokeCap: CircularStrokeCap.round,
      ),
    );
  }
}
