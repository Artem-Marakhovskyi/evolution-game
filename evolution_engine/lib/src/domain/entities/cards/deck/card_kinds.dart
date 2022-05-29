// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

enum CardKinds {
  NONE,

  /// Большой
  HIGH_BODY_WEIGHT,

  /// Быстрое
  RUNNING,

  /// Взаимодействие
  COMMUNICATION,

  /// Водоплавающее
  SWIMMING,

  /// Камуфляж
  CAMOUFLAGE,

  /// Мимикрия
  MIMICRY,

  /// Норное
  BURROWING,

  /// Острое зрение
  SHARP_VISION,

  /// Отбрасывание хвоста
  TAIL_LOSS,

  /// Падальщик
  SCAVENGER,

  /// Паразит
  PARASITE,

  /// Пиратство
  PIRACY,

  /// Симбиоз
  SYMBIOSIS,

  /// Кооперация
  COOPERATION,

  /// Спячка
  HIBERNATION_ABILITY,

  /// Топотун
  GRAZING,

  /// Ядовитый
  POISONOUS,

  /// Хищник
  CARNIVOROUS,

  /// Жировой запас
  FAT_TISSUE,

  /// Пугливое
  FLIGHTY,

  /// Р-стратегия
  R_STRATEGY,

  /// Теплокровность
  HOMEOTHERMY,
}

extension CardKindsExtension on CardKinds {
  String get stringified => EnumToString.convertToString(this);
}