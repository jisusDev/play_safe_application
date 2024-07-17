class CardPlayerModel {
  final String? id;
  final String? tittle;
  final String? subTittle;
  final DateTime? completedAt;

  CardPlayerModel({
    this.id,
    this.tittle,
    this.subTittle,
    this.completedAt,
  });

  bool get done {
    return completedAt != null;
  }

  CardPlayerModel copyWith({
    String? id,
    String? tittle,
    String? subTitle,
    DateTime? completedAt,
  }) =>
      CardPlayerModel(
        id: id ?? this.id,
        tittle: tittle ?? this.tittle,
        subTittle: subTitle ?? subTittle,
        completedAt: completedAt,
      );
}
