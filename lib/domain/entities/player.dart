import 'package:isar/isar.dart';

part 'player.g.dart';

@collection
class Player {

  Id? isarId;
  
  final String? id;
  final String? title;
  final String? subTittle;
  final DateTime? completedAt;

  Player({
    this.id,
    this.title,
    this.subTittle,
    this.completedAt,
  });
}
