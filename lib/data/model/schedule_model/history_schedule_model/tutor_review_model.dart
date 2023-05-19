import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/schedule_model/history_schedule_model/lesson_status.dart';

part 'tutor_review_model.g.dart';

@JsonSerializable()
class TutorReviewModel {
  final String bookingId;
  final String? book;
  final String? unit;
  final String? lesson;
  final String? page;
  final String? lessonProgress;
  final int? behaviorRating;
  final String? behaviorComment;
  final int? listeningRating;
  final String? listeningComment;
  final int? speakingRating;
  final String? speakingComment;
  final int? vocabularyRating;
  final String? vocabularyComment;
  final String? homeworkComment;
  final String? overallComment;
  final LessonStatus? lessonStatus;
  TutorReviewModel(
    this.bookingId,
    this.book,
    this.unit,
    this.lesson,
    this.page,
    this.lessonProgress,
    this.behaviorRating,
    this.behaviorComment,
    this.listeningRating,
    this.listeningComment,
    this.speakingRating,
    this.speakingComment,
    this.vocabularyRating,
    this.vocabularyComment,
    this.homeworkComment,
    this.overallComment,
    this.lessonStatus,
  );

  factory TutorReviewModel.fromJson(Map<String, dynamic> json) =>
      _$TutorReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$TutorReviewModelToJson(this);

  TutorReviewModel clone() {
    return TutorReviewModel(
        bookingId,
        book,
        unit,
        lesson,
        page,
        lessonProgress,
        behaviorRating,
        behaviorComment,
        listeningRating,
        listeningComment,
        speakingRating,
        speakingComment,
        vocabularyRating,
        vocabularyComment,
        homeworkComment,
        overallComment,
        lessonStatus);
  }
}
