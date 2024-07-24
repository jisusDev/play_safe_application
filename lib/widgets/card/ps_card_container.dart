import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';

class CardContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double progressPercent;
  final String? minutes;
  final Function()? onPressed;
  const CardContainer({
    super.key,
    this.title,
    this.subTitle,
    required this.progressPercent,
    this.minutes,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
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
                        title ?? "error subTittle",
                        style: PsTextStyle.titleH2(PsAppcolor.primary),
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
                          subTitle ?? "error tittle",
                          style: PsTextStyle.subTitle(PsAppcolor.white),
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
      ),
    );
  }
}
