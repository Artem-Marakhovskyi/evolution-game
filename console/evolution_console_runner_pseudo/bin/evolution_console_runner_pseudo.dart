import 'dart:convert';
import 'dart:io';

import 'package:cross_cutting/cross_cutting.dart';
import 'package:evolution_engine/evolution_engine.dart';
import 'package:yaml/yaml.dart';

import 'predefined_dependencies_console_module.dart';

Future<void> main(List<String> arguments) async {
  var yamlTool = YamlTool();
  var jsonObj = await yamlTool.readYamlAsJson('predefined/data1.yml');
  print(jsonObj);
  await yamlTool.writeJsonAsYaml('predefined/data2.yml', jsonObj);
  // var consoleDependencies =
  //     PredefinedDependenciesConsoleModule("bin/predefined/inputs/data1.txt");
  // var game = Game(consoleDependencies);

  // var log = game.resolver.get<Log>();
  // log.verbose("Game is being prepared...");
  // await game.prepare();
  // log.verbose("Game is being started...");
  // await game.start();
  // log.verbose("Game completed");
}
