import 'package:cross_cutting/cross_cutting.dart';

class AmbientContext {
  late final EventsService eventsService;
  late final Log log;

  AmbientContext(this.log, this.eventsService);
}
