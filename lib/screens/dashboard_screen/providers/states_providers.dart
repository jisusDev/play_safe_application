import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// changing selection of bottomsheet buttons
final activeButtonProvider = StateProvider<int>((ref) => 0);

final selectTimeInMinuteProvider = StateProvider<int>((ref) => 5);

final selectTimeInSecondProvider = StateProvider<int>((ref) {
  final int valueInMinutes =
      ref.read(selectTimeInMinuteProvider.notifier).state;
  const int secondsInMinutes = 60;
  final int valueInSeconds = valueInMinutes * secondsInMinutes;
  return valueInSeconds;
});

final updateTimeProvider = StateProvider<DateTime>((ref) {
  final int addMinutes = ref.watch(selectTimeInMinuteProvider);
  DateTime now = DateTime.now();
  return now.add(Duration(minutes: addMinutes));
});

final representativeControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final playerControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
