import 'package:freezed_annotation/freezed_annotation.dart';

enum CategoryKey {
  @JsonValue("TRAVEL")
  TRAVEL,
  @JsonValue("BUSINESS")
  BUSINESS,
  @JsonValue("KID")
  KID,
  @JsonValue("BEGINNER")
  BEGINNER
}

final List<String> categoryLevel = [
  'Any Level',
  'Beginner',
  'Upper-Beginner',
  'Pre-Intermediate',
  'Intermediate',
  'Upper-Intermediate',
  'Pre-advanced',
  'Advanced',
  'Very Advanced',
];
