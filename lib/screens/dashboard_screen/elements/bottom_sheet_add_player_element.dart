import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/domain/entities/timer_model.dart';

class BottomSheetAddPlayerElement extends ConsumerWidget {
  const BottomSheetAddPlayerElement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final representativeController = TextEditingController();
    final playerController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final futureTime = ref.watch(updateTimeProvider);

    return PsBottomsheetBase(
      height: 550,
      contentBottomsheet: [
        _titleSection('Agregar Jugador'),
        Form(
          key: formKey,
          child: Column(
            children: [
              PsTextfield(
                label: 'Representante',
                placeholder: 'Francisco Colemanrez',
                controller: representativeController,
                onChanged: (value) {
                  ref.read(representativeUserProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 24),
              PsTextfield(
                label: 'Jugador',
                placeholder: 'Gema Colemanrez',
                controller: playerController,
                onChanged: (value) {
                  ref.read(playerUserProvider.notifier).state = value;
                },
              ),
              const SizedBox(height: 24),
              _titleSection('Elegir Tiempo'),
              const _ButtonsTime(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: PsButton(
                  title: 'Crear Temporizador',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final representative = representativeController.text;
                      final playerName = playerController.text;
                      final selectTimeInMinute =
                          ref.read(selectTimeInMinuteProvider);
                      const secondsToMinute = 60;
                      final selectTimeInSeconds =
                          selectTimeInMinute * secondsToMinute;

                      final newPlayer = Player(
                        title: representative,
                        subTitle: playerName,
                        selectTimeInSeconds: selectTimeInSeconds,
                        futureTime: futureTime,
                      );

                      ref.watch(playerRepositoryProvider).addplayer(newPlayer);

                      ref.read(timersProvider.notifier).addTimer(
                            TimerModel(
                              duration: selectTimeInSeconds,
                              remainingTime: selectTimeInSeconds,
                            ),
                          );

                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
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
        style: PsTextStyle.regularBold(PsAppcolor.black),
      ),
    );
  }
}

List<int> timeList = [5, 15, 25, 35, 45, 60];

class _ButtonsTime extends ConsumerWidget {
  const _ButtonsTime();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeButtonIndex = ref.watch(activeButtonProvider);

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
            final isActive = index == activeButtonIndex;
            return PsChip(
              text: '${timeList[index]} min',
              isActive: isActive,
              onTap: () {
                ref.read(selectTimeInMinuteProvider.notifier).state =
                    timeList[index];
                ref.read(activeButtonProvider.notifier).state = index;
              },
            );
          },
        ),
      ),
    );
  }
}
