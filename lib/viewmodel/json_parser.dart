import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:madagascar_constitution/model/constitution.dart';

class JsonParser {
  const JsonParser._();

  static Future<Constitution> parseDoc(String language) async {
    final jsonFile = await rootBundle.loadString("assets/$language.json");
    final jsonData = jsonDecode(jsonFile) as Map<String, dynamic>;
    return Constitution.fromJson(jsonData);
  }
}
