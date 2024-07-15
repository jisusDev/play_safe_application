import 'package:flutter/material.dart';

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
            color: Colors.grey,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(8),
          minimumSize: WidgetStateProperty.all(const Size(82, 82)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.all(18.0),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            const Color(0xFF3C6E71),
          ),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
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
