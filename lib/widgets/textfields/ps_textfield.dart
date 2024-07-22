import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/utils/utils.dart';

class PsTextfield extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? placeholder;
  final String? label;
  const PsTextfield({
    super.key,
    this.placeholder,
    this.label,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: Validators.validateName,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.words,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
          ],
          maxLength: 15,
          buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) =>
              null,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            filled: true,
            fillColor: PsAppcolor.white,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            labelStyle: PsTextStyle.defaultFont(PsAppcolor.primary),
            hintText: placeholder,
            hintStyle:
                PsTextStyle.bigRegular(PsAppcolor.black.withOpacity(0.2)),
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
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
