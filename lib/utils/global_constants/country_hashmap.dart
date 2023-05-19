import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

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
  late final JsonPathProvider<List<Country>?> fileIO;
  late final Map<String, Country> _map;

  static const String filePath = 'assets/json/countries.json';

  CountryHelper() {
    fileIO = JsonPathProvider<List<Country>?>();
    _map = {};
  }

  Future initialize() async {
    final string = await rootBundle.loadString(filePath);
    final list = jsonDecode(string) as List;
    if (list == null) return;

    for (var ele in list) {
      _map[ele['code']!] = Country(ele['name']!, ele['code']!);
    }
  }

  String getCountryName(String code) {
    code = code.toUpperCase();
    if (_map.containsKey(code)) return _map[code]!.name;
    return code;
  }

  List<Country> coutryNames() {
    return _map.values.toList();
  }
}
