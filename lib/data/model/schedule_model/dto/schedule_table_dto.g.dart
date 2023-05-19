// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_table_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleTableDTO _$$_ScheduleTableDTOFromJson(Map<String, dynamic> json) =>
    _$_ScheduleTableDTO(
      id: json['id'] as String,
      tutorId: json['tutorId'] as String,
      scheduleDetails: (json['scheduleDetails'] as List<dynamic>)
          .map((e) => ScheduleDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleTableDTOToJson(_$_ScheduleTableDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'scheduleDetails': instance.scheduleDetails,
    };
