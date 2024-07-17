import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/widgets.dart';

class ModalEndPlayerElement extends StatelessWidget {
  final Function()? onTap;
  const ModalEndPlayerElement({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const String title = 'Finalización del Jugador';
    const String description =
        'El jugador ha finalizado su actividad. Por favor, confirma cuando el representante lo retire.';
    return PsModal(
      title: title,
      description: description,
      titleButton: 'Finalizar',
      onTap: onTap,
    );
  }
}