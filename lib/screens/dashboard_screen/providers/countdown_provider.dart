import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class CountdownNotifier extends StateNotifier<String> {
  final DateTime finishTime;
  late Timer _timer;

  CountdownNotifier(this.finishTime) : super(_calculateRemainingTime(finishTime)) {
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (finishTime.isBefore(now)) {
        state = "00:00";
        _timer.cancel();
      } else {
        state = _calculateRemainingTime(finishTime);
      }
    });
  }

  static String _calculateRemainingTime(DateTime finishTime) {
    final now = DateTime.now();
    final remainingDuration = finishTime.difference(now);
    final minutes = remainingDuration.inMinutes;
    final seconds = remainingDuration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final countdownProvider = StateNotifierProvider.family<CountdownNotifier, String, DateTime>((ref, finishTime) {
  return CountdownNotifier(finishTime);
});
