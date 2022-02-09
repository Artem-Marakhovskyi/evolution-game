import 'package:cross_cutting/cross_cutting.dart';

class AmbientContext {
  final EventsService eventsService;
  final Log log;

  AmbientContext(this.eventsService, this.log);
}
