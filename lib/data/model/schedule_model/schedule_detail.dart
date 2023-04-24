import 'package:freezed_annotation/freezed_annotation.dart';

import 'booking_info/booking_info_model.dart';

part 'schedule_detail.freezed.dart';
part 'schedule_detail.g.dart';

@freezed
abstract class ScheduleDetailModel implements _$ScheduleDetailModel {
  factory ScheduleDetailModel({
    required String id,
    required String scheduleId,
    required int startPeriodTimestamp,
    required int endPeriodTimestamp,
    required String startPeriod,
    required String endPeriod,
    required bool isBooked,
    required List<BookingInfoModel> bookingInfo,
  }) = _ScheduleDetailModel;
  factory ScheduleDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailModelFromJson(json);
}
