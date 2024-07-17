import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: PsAppcolor.white,
          borderRadius: BorderRadius.circular(16),
        ),
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
                description ?? 'No description',
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
