import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/domain/entities/timer_model.dart';

class TimersNotifier extends StateNotifier<List<TimerModel>> {
  TimersNotifier() : super([]) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _updateTimers();
      },
    );
  }

  void _updateTimers() {
    state = [
      for (final timer in state)
        if (timer.remainingTime > 0)
          TimerModel(
            duration: timer.duration,
            remainingTime: timer.remainingTime - 1,
          )
        else
          timer,
    ];
  }

  void addTimer(TimerModel timer) {
    state = [...state, timer];
  }

  void updateTimer(int index, TimerModel timer) {
    final updatedTimers = [...state];
    updatedTimers[index] = timer;
    state = updatedTimers;
  }

  void removeTimer(int index) {
    final updatedTimers = [...state];
    updatedTimers.removeAt(index);
    state = updatedTimers;
  }
}

final timersProvider = StateNotifierProvider<TimersNotifier, List<TimerModel>>(
  (ref) => TimersNotifier(),
);
