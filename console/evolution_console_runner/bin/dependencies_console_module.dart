import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';
import 'package:evolution_console/evolution_console.dart';
import 'package:get_it/get_it.dart';

class DependenciesConsoleModule extends DependenciesExternalModule {
  late final List<String> _playersNames;
  final Log _log;

  DependenciesConsoleModule(this._playersNames) : _log = Log();

  @override
  EventsService getEventsService() => EventsService(getLog());

  @override
  InputReader getInputReader() => ConsoleInputReader();

  @override
  OutputWriter getOutputWriter() => ConsoleOutputWriter(getLog());

  @override
  PlayersStore getPlayersStore(GetIt resolver) => ConsolePlayersStore(
      _playersNames.map((e) => ConsolePlayer(e, resolver)).toList());

  @override
  CardsStore getCardsStore() => CardsStore.fromShuffled();

  @override
  Log getLog() => _log;
}
