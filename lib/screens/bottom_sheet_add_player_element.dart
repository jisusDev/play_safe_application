import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/config/colors/ps_appcolor.dart';
import 'package:play_safe_application/config/text_styles/ps_text_style.dart';
import 'package:play_safe_application/widgets/buttomsheets/ps_bottomsheet_base.dart';

class BottomSheetAddPlayerElement extends StatelessWidget {
  const BottomSheetAddPlayerElement({super.key});

  @override
  Widget build(BuildContext context) {
    return PsBottomsheetBase(
      height: 500,
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
        const _ButtonsTime(),
        const SizedBox(height: 12),
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

class _ButtonsTime extends StatelessWidget {
  const _ButtonsTime();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 136,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            mainAxisExtent: 56,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return const PsChip(text: '15 min');
          },
        ),
      ),
    );
  }
}