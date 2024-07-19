import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/config/config.dart';
import 'package:play_safe_application/widgets/widgets.dart';
import 'package:play_safe_application/domain/entities/timer_model.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';
import 'package:play_safe_application/screens/dashboard_screen/elements/bottom_sheet_add_player_element.dart';
import 'package:play_safe_application/screens/dashboard_screen/screen/empty_kid_screen/empty_kid_screen.dart';

class AddKidScreen extends ConsumerWidget {
  const AddKidScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timers = ref.watch(timersProvider);

    return Scaffold(
      backgroundColor: PsAppcolor.background,
      body: SafeArea(
        child: timers.isEmpty
            ? const EmptyKidScreen()
            : Stack(
                children: [
                  _Body(timers: timers),
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

class _Body extends StatelessWidget {
  final List<TimerModel> timers;

  const _Body({required this.timers});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: timers.length,
      itemBuilder: (context, index) {
        final timer = timers[index];
        final progressPercent = timer.remainingTime > 0
            ? timer.remainingTime / timer.duration
            : 0.0;
             
        final minutes = timer.remainingTime ~/ 60;
        final seconds = timer.remainingTime % 60;

        // Determine which widget to display based on remainingTime
        Widget childWidget;
        if (timer.remainingTime > 0) {
          childWidget = CardContainer(
            title: "Gema Victoria",
            subTitle: "Francisco Colmenarez",
            progressPercent: progressPercent.toDouble(),
            minutes: '$minutes:${seconds.toString().padLeft(2, '0')}',
            onPressed: () {},
          );
        } else {
          childWidget = PsCardEndPlayer(
            subTitle: "Gema Victoria",
            title: "Francisco Colmenarez",
            onTap: () {
              // Action when tapping PsCardEndPlayer
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
    );
  }
}
