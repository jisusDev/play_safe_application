import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';

class PSAddTimerButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  const PSAddTimerButton({
    super.key,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: PsAppcolor.grey,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(8),
          minimumSize: WidgetStateProperty.all(
            const Size(82, 82),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(18.0),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            PsAppcolor.primary,
          ),
          foregroundColor: WidgetStateProperty.all<Color>(
            PsAppcolor.white,
          ),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 45,
        ),
      ),
    );
  }
}
