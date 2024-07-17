import 'package:flutter/material.dart';
import 'package:play_safe_application/config/config.dart';

class PsButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? backgorundColor;
  final bool isSmall;
  const PsButton({
    super.key,
    this.title,
    this.onTap,
    this.backgorundColor,
    this.isSmall = false,
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
          padding: EdgeInsets.symmetric(
            vertical: isSmall ? 8 : 12,
            horizontal: isSmall ? 32 : 40,
          ),
          child: Text(
            title ?? 'Error',
            style: PsTextStyle.regular(PsAppcolor.white),
          ),
        ),
      ),
    );
  }
}
