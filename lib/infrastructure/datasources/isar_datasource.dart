import 'package:isar/isar.dart';
import 'package:play_safe_application/domain/entities/player.dart';

class IsarDatasource {
  final Isar _isar;

  IsarDatasource(this._isar);

  Future<void> addPlayer(Player player) async {
    await _isar.writeTxn(() async {
      await _isar.players.put(player);
    });
  }

  Future<List<Player>> getAllPlayers() async {
    return await _isar.players.where().findAll();
  }

  Future<void> deletePlayer(int id) async {
    await _isar.writeTxn(() async {
      await _isar.players.delete(id);
    });
  }
}
