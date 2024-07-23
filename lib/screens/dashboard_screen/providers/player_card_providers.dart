import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:play_safe_application/domain/entities/player.dart';

class TimerNotifier extends StateNotifier<TimerState> {
  TimerNotifier()
      : super(
          TimerState(0, false),
        );

  Timer? _timer;

  void start(int duration) {
    //si el operador timer es nulo, c cancela
    if (_timer != null) {
      _timer!.cancel();
    }
    state = TimerState(duration, true);

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.remainingTime > 0) {
          state = TimerState(state.remainingTime - 1, true);
        } else {
          state = TimerState(0, false);
          timer.cancel();
        }
      },
    );
  }

  Duration? diferentTime(Player player) {
    final startTime = player.startTime;
    final finishTime = player.finishTime;

    final diferent = finishTime?.difference(startTime ?? DateTime.now());

    return diferent;
  }

  void stop() {
    if (_timer != null) {
      _timer!.cancel();
    }
    state = TimerState(state.remainingTime, false);
  }

  // void reset(int duration) {
  //   if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //   state = TimerState(duration, false);
  // }
}

class TimerState {
  final int remainingTime;
  final bool isRunning;

  TimerState(this.remainingTime, this.isRunning);
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerState>((ref) {
  return TimerNotifier();
});
