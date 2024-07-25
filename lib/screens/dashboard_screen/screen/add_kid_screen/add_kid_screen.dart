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
    ref.watch(playerNotifierProvider.notifier).loadPlayers();

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
          final player = players[index];
          final finishTime = player.finishTime;

          if (finishTime != null) {
            final countdownTime = ref.watch(countdownProvider(finishTime));

            return Column(
              children: [
                if (countdownTime == "00:00")
                  PsCardEndPlayer(
                    title: player.title ?? "No Title",
                    subTitle: player.subTitle ?? "No Subtitle",
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: PsAppcolor.black.withOpacity(0.5),
                        builder: (context) {
                          return ModalEndPlayerElement(
                            onTap: () {
                              final playerid = player.isarId;
                              final delate = ref
                                  .watch(playerRepositoryProvider)
                                  .deletePlayer(playerid ?? 0);
                              delate;
                              Navigator.pop(context);
                            },
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
                            onTap: () {
                              final playerid = player.isarId;
                              final delate = ref
                                  .watch(playerRepositoryProvider)
                                  .deletePlayer(playerid ?? 0);
                              delate;
                              Navigator.pop(context);
                            },
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
    final DateTime defaultTime = DateTime(1970, 1, 1);
    final startTime = player.startTime ?? defaultTime;
    final finishTime = player.finishTime ?? defaultTime;

    if (startTime == defaultTime || finishTime == defaultTime) {
      return 0.0;
    }

    final now = DateTime.now();
    final totalDuration = finishTime.difference(startTime);
    final elapsedDuration = now.difference(startTime);
    return (elapsedDuration.inSeconds / totalDuration.inSeconds)
        .clamp(0.0, 1.0);
  }
}
