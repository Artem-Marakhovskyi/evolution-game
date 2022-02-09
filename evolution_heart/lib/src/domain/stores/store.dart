import '../entities/identifiable.dart';

abstract class Store<T extends Identifiable> {
  Future<List<T>> fetch();
}
