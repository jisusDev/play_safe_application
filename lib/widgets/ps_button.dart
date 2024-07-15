import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';

class PsButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? backgorundColor;
  const PsButton({
    super.key,
    this.title,
    this.onTap,
    this.backgorundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PsAppcolor.primary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: PsAppcolor.black.withOpacity(0.20),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
          child: Text(
            title ?? 'Error',
            style: PsTextStyle.regular(PsAppcolor.white),
          ),
        ),
      ),
    );
  }
}
