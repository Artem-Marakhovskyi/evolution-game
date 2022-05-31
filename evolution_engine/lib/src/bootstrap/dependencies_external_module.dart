import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/src/domain/state/game_state_initializer.dart';
import 'package:get_it/get_it.dart';

import '../../evolution_engine.dart';

abstract class DependenciesExternalModule {
  GameStateInitializer getGameStateInitializer() => GameStateInitializer();
  CardsStore getCardsStore() => CardsStore.fromShuffled();
  Log getLog() => Log();
  EventsService getEventsService() => EventsService(getLog());
  PlayersStore getPlayersStore(GetIt resolver);
  OutputWriter getOutputWriter();
  InputReader getInputReader();
}
