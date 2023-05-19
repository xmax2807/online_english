import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/tutor_model/dto/basic_teacher_info.dart';

part 'schedule_with_tutor_dto.g.dart';

@JsonSerializable()
class ScheduleWithTutorDTO {
  final String id;
  final String tutorId;
  final String date;
  final int startTimestamp;
  final int endTimestamp;
  final BasicTeacherInfo tutorInfo;
  ScheduleWithTutorDTO(
    this.id,
    this.tutorId,
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.tutorInfo,
  );

  factory ScheduleWithTutorDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleWithTutorDTOFromJson(json);
}
