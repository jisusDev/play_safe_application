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

final futureTimeProvider = StateProvider<String>((ref) => '');

final representativeUserProvider = StateProvider<String>((ref) => '');

final playerUserProvider = StateProvider<String>((ref) => '');
