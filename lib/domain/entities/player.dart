import 'package:isar/isar.dart';

part 'player.g.dart';

@collection
class Player {
  Id? isarId;

  final String? title;
  final String? subTitle;
  final int? selectTimeInSeconds;
  final DateTime? futureTime;

  Player({
    this.title,
    this.subTitle,
    this.selectTimeInSeconds,
    this.futureTime, 
  });
}
