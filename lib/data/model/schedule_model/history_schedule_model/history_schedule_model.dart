import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/schedule_model/history_schedule_model/tutor_review_model.dart';

import '../dto/schedule_with_tutor_dto.dart';

part 'history_schedule_model.g.dart';

@JsonSerializable()
class HistoryScheduleModel {
  final String id;
  final String userId;
  final String scheduleDetailId;
  final String? studentRequest;
  final ScheduleWithTutorDTO scheduleInfo;
  final TutorReviewModel? classReview;
  final String? recordUrl;
  HistoryScheduleModel(
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.studentRequest,
    this.scheduleInfo,
    this.classReview,
    this.recordUrl,
  );
  factory HistoryScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryScheduleModelFromJson(json);
}
