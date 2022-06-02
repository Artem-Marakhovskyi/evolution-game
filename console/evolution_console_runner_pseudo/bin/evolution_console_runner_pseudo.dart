import 'dart:convert';
import 'dart:io';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';
import 'package:yaml/yaml.dart';

import 'predefined_dependencies_console_module.dart';

Future<void> main(List<String> arguments) async {
  var tool = YamlTool();
  var json = await tool.readYamlAsJson("predefined/data1.yml");

  try {
    var animalState = AnimalState.fromJson(json['animalState']);
    print(animalState);
  } on Exception catch (e) {
    print(e);
  }

  //AnimalState.fromJson(json);
  // var consoleDependencies =
  //     PredefinedDependenciesConsoleModule("predefined/inputs/data1.yml");
  // var game = Game(consoleDependencies, );

  // var log = game.resolver.get<Log>();
  // log.verbose("Game is being started...");
  // await game.start();
  // log.verbose("Game completed");
}
