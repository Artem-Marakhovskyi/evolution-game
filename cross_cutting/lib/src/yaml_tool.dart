import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

class YamlTool {
  Future<Map<String, dynamic>> readYamlAsJson(String filename) async {
    try {
      var file = await File(filename).readAsString();
      var doc = loadYaml(file);

      return jsonDecode(json.encode(doc));
    } on Exception catch (e) {
      print(Directory.current);
      print(e);

      return <String, dynamic>{};
    }
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
