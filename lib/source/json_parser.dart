import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:madagascar_constitution/core/constitution_language.dart';
import 'package:madagascar_constitution/model/constitution.dart';

class JsonParser {
  const JsonParser._();

  static Future<Constitution> parseDoc(ConstitutionLanguage language) async {
    final jsonFile = await rootBundle.loadString(
      "assets/${language.name}.json",
    );
    final jsonData = jsonDecode(jsonFile) as Map<String, dynamic>;
    return Constitution.fromJson(jsonData);
  }

  static Future persistDoc(
    Constitution constitution,
    ConstitutionLanguage language,
  ) async {
    final jsonData = jsonEncode(constitution.toJson());
    File file = File("${language.name}.json");
    await file.writeAsString(jsonData);
  }
}
