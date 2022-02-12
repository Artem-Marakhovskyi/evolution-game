import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import 'dependencies_console_module.dart';
import 'stores/models/console_player.dart';

Future<void> main(List<String> arguments) async {
  var players = getConsolePlayers();
  var consoleDependencies = DependenciesConsoleModule(players);
  var log = consoleDependencies.getLog();
  var game = Game(consoleDependencies);

  log.verbose("Game is being prepared...");
  await game.prepare();
  log.verbose("Game is being started...");
  await game.start();
  log.verbose("Game completed");
}

getConsolePlayers() => [ConsolePlayer("Player_A"), ConsolePlayer("Player_B")];
