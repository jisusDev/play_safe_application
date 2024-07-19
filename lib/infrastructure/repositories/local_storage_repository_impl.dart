import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/infrastructure/datasources/isar_datasource.dart';

class LocalStorageRepositoryImpl {
  final IsarDatasource _datasource;

  LocalStorageRepositoryImpl(this._datasource);

  Future<void> addplayer(Player player) async {
    await _datasource.addPlayer(player);
  }

    Future<List<Player>> getAllPlayers() async {
    return await _datasource.getAllPlayers();
  }

  Future<void> deletePlayer(int id) async {
    await _datasource.deletePlayer(id);
  }

}
