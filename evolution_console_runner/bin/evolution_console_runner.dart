import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import 'dependencies_console_module.dart';
import 'stores/models/console_player.dart';

Future<void> main(List<String> arguments) async {
  var log = Log();
  var eventsService = EventsService(log);
  var players = getConsolePlayers(eventsService);
  var consoleDependencies =
      DependenciesConsoleModule(players, log, eventsService);
  var game = Game(consoleDependencies);

  log.verbose("Game is being prepared...");
  await game.prepare();
  log.verbose("Game is being started...");
  await game.start();
  log.verbose("Game completed");
}

getConsolePlayers(EventsService eventsService) => [
      ConsolePlayer("Player_A", eventsService),
      ConsolePlayer("Player_B", eventsService),
    ];
