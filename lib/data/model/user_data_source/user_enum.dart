import 'package:freezed_annotation/freezed_annotation.dart';

enum Level {
  @JsonValue("BEGINNER")
  BEGINNER,
  @JsonValue("HIGHER_BEGINNER")
  HIGHER_BEGINNER,
  @JsonValue("PRE_INTERMEDIATE")
  PRE_INTERMEDIATE,
  @JsonValue("INTERMEDIATE")
  INTERMEDIATE,
  @JsonValue("UPPER_INTERMEDIATE")
  UPPER_INTERMEDIATE,
  @JsonValue("ADVANCED")
  ADVANCED,
  @JsonValue("PROFICIENCY")
  PROFICIENCY,
}

enum Role {
  @JsonValue("student")
  STUDENT,
  @JsonValue("teacher")
  TEACHER,
  @JsonValue("CHANGE_PASSWORD")
  CHANGE_PASSWORD,
}
