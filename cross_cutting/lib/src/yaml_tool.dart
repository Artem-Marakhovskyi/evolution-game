import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

class YamlTool {
  Future<dynamic> readYamlAsJson(String filename) async {
    var file = await File(filename).readAsString();
    var doc = loadYaml(file);

    return json.decode(json.encode(doc));
  }

  Future writeJsonAsYaml(String filename, dynamic jsonObject) async {
    var yamlWriter = YAMLWriter();
    var yamlDoc = yamlWriter.write(jsonObject);

    var file = File(filename);
    if (await file.exists()) {
      await file.delete();
    }

    file.writeAsString(yamlDoc);
  }
}
