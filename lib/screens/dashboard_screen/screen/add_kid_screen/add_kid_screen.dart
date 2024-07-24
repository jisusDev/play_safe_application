import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/domain/entities/timer_model.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/elements.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';
import 'package:play_safe_application/screens/dashboard_screen/screen/empty_kid_screen/empty_kid_screen.dart';

class AddKidScreen extends ConsumerWidget {
  const AddKidScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerNotifierProvider);

    return Scaffold(
      backgroundColor: PsAppcolor.background,
      body: SafeArea(
        child: players.isEmpty
            ? const EmptyKidScreen()
            : Stack(
                children: [
                  const _Body(),
                  Positioned(
                    bottom: 32,
                    right: 30,
                    child: PSAddTimerButton(
                      icon: Icons.alarm_add,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: PsAppcolor.black.withOpacity(0.25),
                          isDismissible: true,
                          isScrollControlled: true,
                          builder: (context) =>
                              const BottomSheetAddPlayerElement(),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final players = ref.watch(playerNotifierProvider);
    final players = ref.watch(sortPlayerListNotifierProvider);
    final timers = ref.watch(timersProvider);


    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];

          final timer = timers.isNotEmpty && index < timers.length
              ? timers[index]
              : TimerModel(duration: 0, remainingTime: 0);

          final progressPercent = timer.remainingTime > 0
              ? timer.remainingTime / timer.duration
              : 0.0;

          final minutes = timer.remainingTime ~/ 60;
          final seconds = timer.remainingTime % 60;

          Widget childWidget;
          if (timer.remainingTime > 0) {
            childWidget = CardContainer(
              title: player.title ?? "No Title",
              subTitle: player.subTitle ?? "No Subtitle",
              progressPercent: progressPercent.toDouble(),
              minutes: '$minutes:${seconds.toString().padLeft(2, '0')}',
              onPressed: () {
                showDialog(
                  context: context,
                  barrierColor: PsAppcolor.black.withOpacity(0.5),
                  builder: (context) {
                    return ModalAnticipatedEndPlayerElement(
                      onTap: () {},
                    );
                  },
                );
              },
            );
          } else {
            childWidget = PsCardEndPlayer(
              title: player.title ?? "No Title",
              subTitle: player.subTitle ?? "No Subtitle",
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: PsAppcolor.black.withOpacity(0.5),
                  builder: (context) {
                    return ModalEndPlayerElement(
                      onTap: () {},
                    );
                  },
                );
              },
            );
          }
          return Column(
            children: [
              childWidget,
              const SizedBox(height: 12),
            ],
          );
        },
      ),
    );
  }
}
