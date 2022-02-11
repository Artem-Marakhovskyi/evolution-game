import 'dart:io';

import 'package:evolution_heart/evolution_heart.dart';

Future<void> main(List<String> arguments) async {
  var game = Game(null);
  await game.prepare();
  print('game started');
  await game.start();
  print('game ended');
}
