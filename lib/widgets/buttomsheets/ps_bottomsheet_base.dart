import 'package:flutter/material.dart';
import 'package:play_safe_application/config/config.dart';

class PsBottomsheetBase extends StatelessWidget {
  final List<Widget> contentBottomsheet;
  final double height;
  const PsBottomsheetBase({
    super.key,
    this.contentBottomsheet = const [],
    this.height = double.minPositive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: PsAppcolor.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: PsAppcolor.black.withOpacity(0.15),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              height: 4,
              width: 64,
              decoration: BoxDecoration(
                color: PsAppcolor.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: contentBottomsheet.isNotEmpty
                  ? contentBottomsheet
                  : [
                      const Text(
                        'No buttons available',
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
