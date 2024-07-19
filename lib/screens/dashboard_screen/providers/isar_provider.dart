import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:play_safe_application/domain/entities/player.dart';
import 'package:play_safe_application/infrastructure/datasources/isar_datasource.dart';
import 'package:play_safe_application/infrastructure/repositories/local_storage_repository_impl.dart';

final playerRepositoryProvider = Provider<LocalStorageRepositoryImpl>((ref) {
  final dataSource = IsarDatasource();
  return LocalStorageRepositoryImpl(dataSource);
});


final playersProvider = FutureProvider<List<Player>>((ref) async {
  final repository = ref.read(playerRepositoryProvider);
  return await repository.getAllPlayers();
});
