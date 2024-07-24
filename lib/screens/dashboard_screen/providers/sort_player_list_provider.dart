import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/screens/dashboard_screen/providers/providers.dart';

final sortPlayerListNotifierProvider = Provider<List<Player>>((ref) {
  final players = ref.watch(playerNotifierProvider);
  final now = DateTime.now();

  players.sort((a, b) {
    final aCompleted = a.isCompleted ?? false;
    final bCompleted = b.isCompleted ?? false;

    if (aCompleted && !bCompleted) return -1;
    if (!aCompleted && bCompleted) return 1;

    final aFinishTime = a.finishTime ?? now;
    final bFinishTime = b.finishTime ?? now;
    return aFinishTime.difference(now).compareTo(bFinishTime.difference(now));
  });

  return players;
});

