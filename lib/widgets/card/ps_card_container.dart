import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/circular_percent_indicator/ps_circular_percent_indicator.dart';

//!Cant make optional parameters
class CardContainer extends StatelessWidget {
  final String tittle;
  final String subTittle;
  final double progressPercent;
  final String minutes;
  final VoidCallback onPressed;
  const CardContainer({
    super.key,
    required this.tittle,
    required this.subTittle,
    required this.progressPercent,
    required this.minutes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 355,
        height: 101,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subTittle,
                      style: const TextStyle(
                        color: Color(0xFF3C6E71),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF3C6E71),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Text(
                        tittle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PSCircularPercentIndicator(
                radius: 35,
                lineWidth: 6.0,
                progressPercent: progressPercent,
                numberMinutes: minutes,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
