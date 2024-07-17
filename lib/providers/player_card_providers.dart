import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CardFilter { all, completed, pending }

final cardFilterProvider = StateProvider<CardFilter>((ref) {
  return CardFilter.all;
});
