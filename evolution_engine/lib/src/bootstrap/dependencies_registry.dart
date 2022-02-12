import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/io/input/input_reader.dart';
import 'package:evolution_engine/src/io/output/output_writer.dart';
import 'package:evolution_engine/src/stores/cards_store.dart';
import 'package:evolution_engine/src/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../domain/die.dart';
import 'ambient_context.dart';
import 'dependencies_external_module.dart';

class DependenciesRegistry {
  DependenciesRegistry(DependenciesExternalModule externalModules) {
    GetIt.I.registerFactory<Die>(() => Die(1));
    GetIt.I.registerSingleton(EventsService(externalModules.getLog()));
    GetIt.I.registerSingleton(
        AmbientContext(externalModules.getLog(), GetIt.I.get<EventsService>()));

    GetIt.I.registerSingleton<OutputWriter>(externalModules.getOutputWriter());
    GetIt.I.registerSingleton<InputReader>(externalModules.getInputReader());
    GetIt.I.registerSingleton<CardsStore>(externalModules.getCardsStore());
    GetIt.I.registerSingleton<PlayersStore>(externalModules.getPlayersStore());
    GetIt.I.registerSingleton<Log>(externalModules.getLog());
  }
}
