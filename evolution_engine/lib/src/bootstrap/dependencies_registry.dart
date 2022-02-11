import 'dart:async';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_heart/evolution_engine.dart';
import 'package:evolution_heart/src/bootstrap/ambient_context.dart';
import 'package:evolution_heart/src/domain/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../domain/die.dart';

class DependenciesRegistry {
  DependenciesRegistry([DependenciesExternalModule? externalModules]) {
    GetIt.I.registerFactory<Die>(() => Die(1));
    GetIt.I.registerSingleton(Log());
    GetIt.I.registerSingleton(EventsService(GetIt.I.get()));
    GetIt.I.registerSingleton(AmbientContext());

    externalModules ??= DependenciesExternalModule();

    GetIt.I.registerSingleton<CardsStore>(externalModules.getCardsStore());
    GetIt.I.registerSingleton<PlayersStore>(externalModules.getPlayersStore());
  }
}

class DependenciesExternalModule {
  CardsStore getCardsStore() => CardsStore();
  PlayersStore getPlayersStore() => PlayersStore();
}
