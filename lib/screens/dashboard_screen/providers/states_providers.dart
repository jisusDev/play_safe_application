import 'package:flutter_riverpod/flutter_riverpod.dart';


// changing selection of bottomsheet buttons
final activeButtonProvider = StateProvider<int>((ref) => 0);

final valuebuttonTimeProvider = StateProvider<int>((ref) => 5);

final representativeUserProvider = StateProvider<String>((ref) => '');

final playerUserProvider = StateProvider<String>((ref) => '');



