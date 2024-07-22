import 'package:isar/isar.dart';

part 'player.g.dart';

@collection
class Player {
  Id? isarId;

  final String? title;
  final String? subTitle;
  final int? selectTimeInSeconds;
  final DateTime? startTime;
  final DateTime? finishTime;

  Player({
    this.title,
    this.subTitle,
    this.selectTimeInSeconds,
    this.startTime, 
    this.finishTime, 
  });
}
