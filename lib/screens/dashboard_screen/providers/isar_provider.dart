import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/infrastructure/datasources/isar_datasource.dart';
import 'package:play_safe_application/infrastructure/repositories/local_storage_repository_impl.dart';

final playerRepositoryProvider = Provider<LocalStorageRepositoryImpl>((ref) {
  final dataSource = IsarDatasource();
  return LocalStorageRepositoryImpl(dataSource);
});

class PlayerNotifier extends StateNotifier<List<Player>> {
  final LocalStorageRepositoryImpl repository;

  PlayerNotifier(this.repository) : super([]) {
    loadPlayers();
  }

  Future<void> loadPlayers() async {
    final players = await repository.getAllPlayers();
    state = players;
  }

  Future<void> addPlayer(Player player) async {
    await repository.addplayer(player);
    await loadPlayers();
  }

  Future<void> deletePlayer(int id) async {
    await repository.deletePlayer(id);
    await loadPlayers();
  }
}

final playerNotifierProvider =
    StateNotifierProvider<PlayerNotifier, List<Player>>((ref) {
  final repository = ref.watch(playerRepositoryProvider);
  return PlayerNotifier(repository);
});
