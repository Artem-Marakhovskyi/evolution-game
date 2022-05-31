import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import 'dependencies_console_module.dart';

Future<void> main(List<String> arguments) async {
  var consoleDependencies = DependenciesConsoleModule(["Player A", "Player B"]);
  var game = Game(consoleDependencies);

  var log = game.resolver.get<Log>();
  log.verbose("Game is being started...");
  await game.start();
  log.verbose("Game completed");
}
