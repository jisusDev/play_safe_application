import 'package:flutter/material.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';

class PsModal extends StatelessWidget {
  final String? title;
  final String? description;
  final String? titleButton;
  final Function()? onTap;

  const PsModal({
    super.key,
    this.title,
    this.description,
    this.titleButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PsAppcolor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              Text(
                title ?? 'No title',
                style: PsTextStyle.regularBold(PsAppcolor.black),
              ),
              const SizedBox(height: 24),
              Text(
                description ?? 'No description', textAlign: TextAlign.center,
                style: PsTextStyle.defaultFont(PsAppcolor.black),
              ),
              const SizedBox(height: 32),
              PsButton(
                isSmall: true,
                title: titleButton,
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
