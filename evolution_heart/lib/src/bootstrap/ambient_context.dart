import 'package:cross_cutting/cross_cutting.dart';
import 'package:get_it/get_it.dart';

class AmbientContext {
  late final EventsService eventsService;
  late final Log log;

  AmbientContext() {
    log = GetIt.I.get<Log>();
    eventsService = GetIt.I.get<EventsService>();
  }
}
