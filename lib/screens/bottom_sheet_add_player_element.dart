import 'package:flutter/material.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';
import 'package:play_safe_application/widgets/buttomsheets/ps_bottomsheet_base.dart';
import 'package:play_safe_application/widgets/widgets.dart';

class BottomSheetAddPlayerElement extends StatelessWidget {
  const BottomSheetAddPlayerElement({super.key});

  @override
  Widget build(BuildContext context) {
    return PsBottomsheetBase(
      contentBottomsheet: [
        _titleSection('Agregar Jugador'),
        const PsTextfield(
          label: 'Representante',
          placeholder: 'Francisco Colemanrez',
        ),
        const SizedBox(height: 8),
        const PsTextfield(
          label: 'Jugador',
          placeholder: 'Gema Colemanrez',
        ),
        const SizedBox(height: 24),
        _titleSection('Elegir Tiempo'),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: PsButton(
            title: 'Agregar Temporizador',
          ),
        ),
      ],
    );
  }

  Padding _titleSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: PsTextStyle.regularDold(PsAppcolor.black),
      ),
    );
  }
}
