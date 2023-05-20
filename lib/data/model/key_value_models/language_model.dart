import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class Language {
  final String key;
  final String name;

  Language(
    this.key,
    this.name,
  );

  factory Language.fromJson(Map<String, dynamic> json) =>
      Language(json['key'], json['description']);
}
