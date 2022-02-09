import 'package:get_it/get_it.dart';

import '../domain/die.dart';

class DependenciesRegistrator {
  void run() {
    GetIt.I.registerFactory<Die>(() => Die(1));
  }
}
