import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';

class PsChip extends StatelessWidget {
  final String? text;
  final bool isActive;
  final Function()? onTap;
  const PsChip({
    super.key,
    this.text,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: isActive ? 0 : 4),
        child: Container(
          width: 100,
          height: isActive ? 56 : 48,
          decoration: BoxDecoration(
            color: isActive ? PsAppcolor.secundary : PsAppcolor.white,
            border: Border.all(
              width: 2,
              color: PsAppcolor.black.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              isActive
                  ? BoxShadow(
                      color: PsAppcolor.black.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    )
                  : BoxShadow(
                      color: PsAppcolor.black.withOpacity(0.05),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                    ),
            ],
          ),
          child: Center(
            child: Text(
              text ?? 'error',
              style: PsTextStyle.regular(
                isActive ? PsAppcolor.white : PsAppcolor.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
