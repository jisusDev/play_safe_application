import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';

class PsChip extends StatelessWidget {
  final String? text;
  final bool isActive;
  final Function()? onTap;
  const PsChip({
    super.key,
    this.text,
    this.isActive = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isActive ? PsAppcolor.white : PsAppcolor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
