import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/schedule_model/dto/schedule_with_tutor_dto.dart';

part 'upcoming_schedule_model.g.dart';

@JsonSerializable()
class UpcomingScheduleModel {
  final String id;
  final String userId;
  final String scheduleDetailId;
  final String tutorMeetingLink;
  final String studentMeetingLink;
  final String? studentRequest;
  final String? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final ScheduleWithTutorDTO scheduleInfo;

  UpcomingScheduleModel(
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.scheduleInfo,
  );

  factory UpcomingScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingScheduleModelFromJson(json);
}
