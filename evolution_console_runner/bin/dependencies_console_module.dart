import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';

import 'io/console_input_reader.dart';
import 'io/console_output_writer.dart';
import 'stores/console_cards_store.dart';
import 'stores/console_players_store.dart';

class DependenciesConsoleModule extends DependenciesExternalModule {
  final List<Player> _players;
  late final Log _log;
  late final EventsService _eventsService;

  DependenciesConsoleModule(this._players, this._log, this._eventsService);

  @override
  EventsService getEventsService() => _eventsService;

  @override
  InputReader getInputReader() => ConsoleInputReader();

  @override
  OutputWriter getOutputWriter() => ConsoleOutputWriter(getLog());

  @override
  PlayersStore getPlayersStore() => ConsolePlayersStore(_players);

  @override
  CardsStore getCardsStore() => ConsoleCardsStore();

  @override
  Log getLog() => _log;
}
