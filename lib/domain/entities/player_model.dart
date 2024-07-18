class PlayerModel {
  final String? id;
  final String? tittle;
  final String? subTittle;
  final DateTime? completedAt;

  PlayerModel({
    this.id,
    this.tittle,
    this.subTittle,
    this.completedAt,
  });

  bool get done {
    return completedAt != null;
  }

  PlayerModel copyWith({
    String? id,
    String? tittle,
    String? subTitle,
    DateTime? completedAt,
  }) =>
      PlayerModel(
        id: id ?? this.id,
        tittle: tittle ?? this.tittle,
        subTittle: subTitle ?? subTittle,
        completedAt: completedAt,
      );
}
