// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorReviewModel _$TutorReviewModelFromJson(Map<String, dynamic> json) =>
    TutorReviewModel(
      json['bookingId'] as String,
      json['book'] as String?,
      json['unit'] as String?,
      json['lesson'] as String?,
      json['page'] as String?,
      json['lessonProgress'] as String?,
      json['behaviorRating'] as int?,
      json['behaviorComment'] as String?,
      json['listeningRating'] as int?,
      json['listeningComment'] as String?,
      json['speakingRating'] as int?,
      json['speakingComment'] as String?,
      json['vocabularyRating'] as int?,
      json['vocabularyComment'] as String?,
      json['homeworkComment'] as String?,
      json['overallComment'] as String?,
      json['lessonStatus'] == null
          ? null
          : LessonStatus.fromJson(json['lessonStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TutorReviewModelToJson(TutorReviewModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'book': instance.book,
      'unit': instance.unit,
      'lesson': instance.lesson,
      'page': instance.page,
      'lessonProgress': instance.lessonProgress,
      'behaviorRating': instance.behaviorRating,
      'behaviorComment': instance.behaviorComment,
      'listeningRating': instance.listeningRating,
      'listeningComment': instance.listeningComment,
      'speakingRating': instance.speakingRating,
      'speakingComment': instance.speakingComment,
      'vocabularyRating': instance.vocabularyRating,
      'vocabularyComment': instance.vocabularyComment,
      'homeworkComment': instance.homeworkComment,
      'overallComment': instance.overallComment,
      'lessonStatus': instance.lessonStatus,
    };
