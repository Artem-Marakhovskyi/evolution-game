import 'package:cross_cutting/cross_cutting.dart';

import '../../evolution_engine.dart';

abstract class DependenciesExternalModule {
  CardsStore getCardsStore() => CardsStore();
  Log getLog() => Log();
  EventsService getEventsService() => EventsService(getLog());
  PlayersStore getPlayersStore();
  OutputWriter getOutputWriter();
  InputReader getInputReader();
}
