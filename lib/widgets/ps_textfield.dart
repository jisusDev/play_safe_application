import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';

class PsTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  const PsTextfield({
    super.key,
    this.placeholder,
    this.label,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: PsAppcolor.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            filled: true,
            fillColor: PsAppcolor.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            labelStyle: PsTextStyle.defaultFont(PsAppcolor.primary),
            hintText: placeholder,
            hintStyle: PsTextStyle.bigRegular(PsAppcolor.black.withOpacity(0.2)),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: PsAppcolor.black.withOpacity(0.2),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: PsAppcolor.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
