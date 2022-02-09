import 'dart:convert';

import '../cross_cutting.dart';

class EventsService {
  final Log _log;

  EventsService(this._log);

  void raise(String name, Map<String, String> data) {
    _log.info("$name || ${json.encode(data)}");
  }
}
