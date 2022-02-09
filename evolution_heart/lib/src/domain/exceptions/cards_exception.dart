import 'dart:core';

class CardsException implements Exception {
  final String message;

  CardsException._(this.message);

  factory CardsException(String message) {
    return CardsException(message);
  }
}
