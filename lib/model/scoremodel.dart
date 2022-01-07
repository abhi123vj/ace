import 'package:meta/meta.dart';
import 'dart:convert';

Map<String, int> scoreFromMap(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, int>(k, v));

String scoreToMap(Map<String, int> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
