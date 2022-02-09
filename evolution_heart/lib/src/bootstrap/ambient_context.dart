import 'package:cross_cutting/cross_cutting.dart';

class AmbientContext {
  final EventsService _eventsService;
  final Log _log;

  AmbientContext(this._eventsService, this._log);
}
