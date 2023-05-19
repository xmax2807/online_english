import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_info_model.freezed.dart';
part 'lesson_info_model.g.dart';

@freezed
abstract class LessonModel implements _$LessonModel {
  factory LessonModel({
    required String id,
    required String key,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _LessonModel;
  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);
}
