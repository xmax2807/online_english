import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/schedule_model/schedule_detail.dart';

part 'schedule_table_dto.freezed.dart';
part 'schedule_table_dto.g.dart';

@freezed
class ScheduleTableDTO with _$ScheduleTableDTO {
  factory ScheduleTableDTO({
    required String id,
    required String tutorId,
    required List<ScheduleDetailModel> scheduleDetails,
  }) = _ScheduleTableDTO;
  factory ScheduleTableDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTableDTOFromJson(json);
}
