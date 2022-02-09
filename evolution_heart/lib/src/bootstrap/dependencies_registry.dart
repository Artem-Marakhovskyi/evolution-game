import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_heart/evolution_heart.dart';
import 'package:evolution_heart/src/domain/stores/players_store.dart';
import 'package:get_it/get_it.dart';

import '../domain/die.dart';

class DependenciesRegistry {
  void run() {
    GetIt.I.registerFactory<Die>(() => Die(1));
    GetIt.I.registerSingleton(Log());
    GetIt.I.registerSingleton(EventsService(GetIt.I.get()));

    var externals = DependenciesExternalModule();

    GetIt.I.registerSingleton<CardsStore>(externals.getCardsStore());
    GetIt.I.registerSingleton<PlayersStore>(externals.getPlayersStore());
  }
}

class DependenciesExternalModule {
  CardsStore getCardsStore() => CardsStore();

  PlayersStore getPlayersStore() => PlayersStore();
}
