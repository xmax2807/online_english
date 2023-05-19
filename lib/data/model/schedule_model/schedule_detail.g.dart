// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleDetailModel _$$_ScheduleDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_ScheduleDetailModel(
      id: json['id'] as String,
      scheduleId: json['scheduleId'] as String,
      startPeriodTimestamp: json['startPeriodTimestamp'] as int,
      endPeriodTimestamp: json['endPeriodTimestamp'] as int,
      startPeriod: json['startPeriod'] as String,
      endPeriod: json['endPeriod'] as String,
      isBooked: json['isBooked'] as bool,
      bookingInfo: (json['bookingInfo'] as List<dynamic>)
          .map((e) => BookingInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ScheduleDetailModelToJson(
        _$_ScheduleDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'isBooked': instance.isBooked,
      'bookingInfo': instance.bookingInfo,
    };
