import 'package:flutter/material.dart';
import 'package:play_safe_application/widgets/widgets.dart';

class ModalAnticipatedEndPlayerElement extends StatelessWidget {
  final Function()? onTap;
  const ModalAnticipatedEndPlayerElement({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const String title = 'Finalización Anticipada del Jugador';
    const String description =
        '¿Desea finalizar antes de tiempo al jugador? Por favor, confirme para proceder con la finalización.';
    return PsModal(
      title: title,
      description: description,
      titleButton: 'Finalizar',
      onTap: onTap,
    );
  }
}
