import 'package:evolution_heart/src/model/die.dart';
import 'package:get_it/get_it.dart';

class DependenciesRegistrator {
  void run() {
    GetIt.I.registerFactory<Die>(() => Die(1));
  }
}
