import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/model/key_value_models/language_model.dart';
import '../io/path_provider_io.dart';

@JsonSerializable()
class Country {
  final String name;
  final String code;

  Country(this.name, this.code);
  @override
  String toString() {
    return name;
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is Country) {
      return other.code == code;
    }
    return super == other;
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(json['name'], json['code']);
  }
}

class CountryHelper {
  late final JsonPathProvider fileIO;
  late final Map<String, Country> _countryMap;
  late final Map<String, Language> languageMap;

  static const String filePath = 'assets/json/countries.json';

  CountryHelper() {
    fileIO = JsonPathProvider();
    _countryMap = {};
    languageMap = {};
  }

  Future initialize() async {
    final string = await rootBundle.loadString(filePath);
    final list = jsonDecode(string) as List;
    if (list == null) return;

    for (var ele in list) {
      _countryMap[ele['code']!] = Country(ele['name']!, ele['code']!);
    }
  }

  String getCountryName(String code) {
    code = code.toUpperCase();
    if (_countryMap.containsKey(code)) return _countryMap[code]!.name;
    return code;
  }

  String getLanguangeName(String code) {
    code = code.toLowerCase();
    if (languageMap.containsKey(code)) return languageMap[code]!.name;
    return code;
  }

  List<Country> coutryNames() {
    return _countryMap.values.toList();
  }
}
