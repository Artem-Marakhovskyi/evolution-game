import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/state/game_state_initializer.dart';
import 'package:evolution_engine/src/io/input/input_reader.dart';
import 'package:evolution_engine/src/io/output/output_writer.dart';
import 'package:evolution_engine/src/stores/cards_store.dart';
import 'package:evolution_engine/src/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/die.dart';
import 'ambient_context.dart';
import 'dependencies_external_module.dart';

class DependenciesRegistry {
  final GetIt resolver;

  DependenciesRegistry(DependenciesExternalModule externalModules)
      : resolver = GetIt.I {
    resolver.registerFactory<Die>(() => Die(1));
    resolver.registerSingleton(EventsService(externalModules.getLog()));
    resolver.registerSingleton(AmbientContext(
        externalModules.getLog(), resolver.get<EventsService>()));
    resolver.registerSingleton<OutputWriter>(externalModules.getOutputWriter());
    resolver.registerSingleton<InputReader>(externalModules.getInputReader());
    resolver.registerSingleton<CardsStore>(externalModules.getCardsStore());
    resolver.registerSingleton<Log>(externalModules.getLog());
    resolver.registerSingleton<PlayersStore>(
        externalModules.getPlayersStore(resolver));
    resolver.registerSingleton(GameStateInitializer());
  }
}
