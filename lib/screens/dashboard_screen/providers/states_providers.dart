import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//position of pressed button in bottomsheet
final activeButtonProvider = StateProvider<int>((ref) => 0);

//value of time buttons in bottomsheet
final selectTimeInMinuteProvider = StateProvider<int>((ref) => 5);

//selected time value in seconds in bottomsheet
final selectTimeInSecondProvider = StateProvider<int>((ref) {
  final int valueInMinutes =
      ref.read(selectTimeInMinuteProvider.notifier).state;
  const int secondsInMinutes = 60;
  final int valueInSeconds = valueInMinutes * secondsInMinutes;
  return valueInSeconds;
});

//value between the start time and the end time
final updateTimeProvider = StateProvider<DateTime>((ref) {
  final int addMinutes = ref.watch(selectTimeInMinuteProvider);
  DateTime now = DateTime.now();
  return now.add(Duration(minutes: addMinutes));
});

//TextEditingController of bottomsheet textfields
final representativeControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final playerControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
