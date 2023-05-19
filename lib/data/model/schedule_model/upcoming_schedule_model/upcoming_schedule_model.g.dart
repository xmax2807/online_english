// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingScheduleModel _$UpcomingScheduleModelFromJson(
        Map<String, dynamic> json) =>
    UpcomingScheduleModel(
      json['id'] as String,
      json['userId'] as String,
      json['scheduleDetailId'] as String,
      json['tutorMeetingLink'] as String,
      json['studentMeetingLink'] as String,
      json['studentRequest'] as String?,
      json['cancelReasonId'] as String?,
      json['lessonPlanId'] as String?,
      json['cancelNote'] as String?,
      ScheduleWithTutorDTO.fromJson(
          json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpcomingScheduleModelToJson(
        UpcomingScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'cancelReasonId': instance.cancelReasonId,
      'lessonPlanId': instance.lessonPlanId,
      'cancelNote': instance.cancelNote,
      'scheduleInfo': instance.scheduleInfo,
    };
