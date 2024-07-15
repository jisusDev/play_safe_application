import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PSCircularPercentIndicator extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final double progressPercent;
  final String numberMinutes;
  const PSCircularPercentIndicator({
    super.key,
    required this.radius,
    required this.lineWidth,
    required this.progressPercent,
    required this.numberMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      percent: progressPercent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numberMinutes,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
              color: Color(0xFF3C6E71),
            ),
          ),
          const Text(
            "mins",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
      progressColor: const Color(0xFFE49E20),
      backgroundColor: Colors.grey.shade200,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
