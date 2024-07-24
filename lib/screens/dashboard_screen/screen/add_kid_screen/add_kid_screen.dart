import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/domain/entities/timer_model.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/bottom_sheet_add_player_element.dart';
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
                  _Body(players: players),
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
  final List<Player> players;

  const _Body({required this.players});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        final player = players[index];
        final diferentTime =
            ref.read(timerProvider.notifier).diferentTime(player);
        final remainingTime = diferentTime != null ? diferentTime.inSeconds : 0;
        final duration = player.duration;

        final progressPercent =
            (duration > 0) ? (remainingTime / duration).clamp(0.0, 1.0) : 0.0;

        final minutes = remainingTime ~/ 60;
        final seconds = remainingTime % 60;

        Widget childWidget;
        if (remainingTime > 0) {
          childWidget = CardContainer(
            title: player.title ?? "No Title",
            subTitle: player.subTitle ?? "No Subtitle",
            progressPercent: progressPercent.toDouble(),
            minutes: '$minutes:${seconds.toString().padLeft(2, '0')}',
            onPressed: () {},
          );
        } else {
          childWidget = PsCardEndPlayer(
            title: player.title ?? "No Title",
            subTitle: player.subTitle ?? "No Subtitle",
            onTap: () {},
          );
        }

        return Column(
          children: [
            childWidget,
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
