import 'package:cross_cutting/cross_cutting.dart';
import 'package:get_it/get_it.dart';

class Card {
  late final Log _log;

  Card() {
    _log = GetIt.I.get<Log>();
  }
}
