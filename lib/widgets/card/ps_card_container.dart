import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';
import 'package:play_safe_application/widgets/circular_percent_indicator/ps_circular_percent_indicator.dart';

class CardContainer extends StatelessWidget {
  final String? subTittle;
  final String? tittle;
  final double progressPercent;
  final String? minutes;
  final Function()? onPressed;
  const CardContainer({
    super.key,
    this.tittle,
    this.subTittle,
    required this.progressPercent,
    this.minutes,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 355,
        height: 101,
        decoration: BoxDecoration(
          color: PsAppcolor.white,
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
                      subTittle ?? "error subTittle",
                      style: PsTextStyle.titleH2(PsAppcolor.primary)
                    ),
                    const SizedBox(height: 4),
                    Container(
                      decoration: const BoxDecoration(
                        color: PsAppcolor.primary,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Text(
                        tittle ?? "error tittle",
                        style: PsTextStyle.subTitle(PsAppcolor.white)
                      ),
                    ),
                  ],
                ),
              ),
              PSCircularPercentIndicator(
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
