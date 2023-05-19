import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_info_dto.freezed.dart';
part 'lesson_info_dto.g.dart';

@freezed
abstract class LessonInfoDTO implements _$LessonInfoDTO {
  factory LessonInfoDTO({
    required String id,
    required String key,
    required String name,
  }) = _LessonInfoDTO;
  factory LessonInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$LessonInfoDTOFromJson(json);
}
