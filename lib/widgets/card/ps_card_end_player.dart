import 'package:flutter/material.dart';
import 'package:play_safe_application/config/config.dart';

class PsCardEndPlayer extends StatelessWidget {
  final String? subTitle;
  final String? title;
  final Function()? onTap;
  const PsCardEndPlayer({
    super.key,
    this.subTitle,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: PsAppcolor.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                _DataUserSection(title: title, subTitle: subTitle),
                const Spacer(),
                Text(
                  'Finalizar',
                  style: PsTextStyle.regularBold(PsAppcolor.white),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: PsAppcolor.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DataUserSection extends StatelessWidget {
  const _DataUserSection({
    required this.title,
    required this.subTitle,
  });

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? 'no name',
          style: PsTextStyle.titleH2(PsAppcolor.white),
        ),
        Container(
          decoration: BoxDecoration(
            color: PsAppcolor.white,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              subTitle ?? 'no subtitle',
              style: PsTextStyle.subTitle(PsAppcolor.primary),
            ),
          ),
        ),
      ],
    );
  }
}
