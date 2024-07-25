import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/elements.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';

class AddKidScreen extends ConsumerWidget {
  const AddKidScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerNotifierProvider);

    return Scaffold(
      backgroundColor: PsAppcolor.background,
      body: SafeArea(
        child: players.isEmpty
            ? const PSEmptyKid()
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
    final players = ref.watch(sortPlayerListNotifierProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          ref.watch(playerNotifierProvider.notifier).loadPlayers();
          final player = players[index];
          final finishTime = player.finishTime;

          if (finishTime != null) {
            final countdownTime = ref.watch(countdownProvider(finishTime));

            final bool isTimeUp = countdownTime == "00:00";

            return Column(
              children: [
                if (isTimeUp)
                  PsCardEndPlayer(
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
                  )
                else
                  CardContainer(
                    title: player.title ?? "No Title",
                    subTitle: player.subTitle ?? "No Subtitle",
                    progressPercent: calculateProgress(player),
                    minutes: countdownTime,
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
                  ),
                const SizedBox(height: 12),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  double calculateProgress(Player player) {
    if (player.startTime == null || player.finishTime == null) {
      return 0.0;
    }
    final now = DateTime.now();
    final totalDuration = player.finishTime!.difference(player.startTime!);
    final elapsedDuration = now.difference(player.startTime!);
    return (elapsedDuration.inSeconds / totalDuration.inSeconds)
        .clamp(0.0, 1.0);
  }
}
