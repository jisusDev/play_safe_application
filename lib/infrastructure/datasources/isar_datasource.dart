import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:isar/isar.dart';
import 'package:play_safe_application/domain/entities/player.dart';

class IsarDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([PlayerSchema], inspector: true, directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addPlayer(Player player) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.players.put(player);
    });
  }

  Future<List<Player>> getAllPlayers() async {
    final isar = await db;
    return await isar.players.where().findAll();
  }

  Future<void> deletePlayer(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.players.delete(id);
    });
  }
}
