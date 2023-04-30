// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryScheduleModel _$HistoryScheduleModelFromJson(
        Map<String, dynamic> json) =>
    HistoryScheduleModel(
      json['id'] as String,
      json['userId'] as String,
      json['scheduleDetailId'] as String,
      json['studentRequest'] as String?,
      ScheduleWithTutorDTO.fromJson(
          json['scheduleInfo'] as Map<String, dynamic>),
      json['classReview'] == null
          ? null
          : TutorReviewModel.fromJson(
              json['classReview'] as Map<String, dynamic>),
      json['recordUrl'] as String?,
    );

Map<String, dynamic> _$HistoryScheduleModelToJson(
        HistoryScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'studentRequest': instance.studentRequest,
      'scheduleInfo': instance.scheduleInfo,
      'classReview': instance.classReview,
      'recordUrl': instance.recordUrl,
    };
