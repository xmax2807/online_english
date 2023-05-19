// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_with_tutor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleWithTutorDTO _$ScheduleWithTutorDTOFromJson(
        Map<String, dynamic> json) =>
    ScheduleWithTutorDTO(
      json['id'] as String,
      json['tutorId'] as String,
      json['date'] as String,
      json['startTimestamp'] as int,
      json['endTimestamp'] as int,
      BasicTeacherInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleWithTutorDTOToJson(
        ScheduleWithTutorDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'tutorInfo': instance.tutorInfo,
    };
