// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_lesson_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TutorLessonReviewModel _$$_TutorLessonReviewModelFromJson(
        Map<String, dynamic> json) =>
    _$_TutorLessonReviewModel(
      listening: RatingData.fromJson(json['listening'] as Map<String, dynamic>),
      behaviour: RatingData.fromJson(json['behaviour'] as Map<String, dynamic>),
      speaking: RatingData.fromJson(json['speaking'] as Map<String, dynamic>),
      vocabulary:
          RatingData.fromJson(json['vocabulary'] as Map<String, dynamic>),
      comments: json['comments'] as String,
    );

Map<String, dynamic> _$$_TutorLessonReviewModelToJson(
        _$_TutorLessonReviewModel instance) =>
    <String, dynamic>{
      'listening': instance.listening,
      'behaviour': instance.behaviour,
      'speaking': instance.speaking,
      'vocabulary': instance.vocabulary,
      'comments': instance.comments,
    };
