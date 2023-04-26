import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/tutor_lesson_review/rating_data.dart';

part 'tutor_lesson_review.freezed.dart';
part 'tutor_lesson_review.g.dart';

@freezed
class TutorLessonReviewModel with _$TutorLessonReviewModel {
  List<RatingData> get ratings => [listening, behaviour, speaking, vocabulary];
  const TutorLessonReviewModel._();

  static TutorLessonReviewModel convert(
      {required double listenVal,
      required String listenComment,
      required double behaviourVal,
      required String behaviourComment,
      required double speakValue,
      required String speakComment,
      required double vocabVal,
      required String vocabComment,
      required String comment}) {
    return TutorLessonReviewModel(
        listening: RatingData(
          label: "Listening",
          value: listenVal,
          comment: listenComment,
        ),
        behaviour: RatingData(
          label: "Behaviour",
          value: behaviourVal,
          comment: behaviourComment,
        ),
        speaking: RatingData(
          label: "Speaking",
          value: speakValue,
          comment: speakComment,
        ),
        vocabulary: RatingData(
          label: "Vocabulary",
          value: vocabVal,
          comment: vocabComment,
        ),
        comments: comment);
  }

  factory TutorLessonReviewModel({
    required RatingData listening,
    required RatingData behaviour,
    required RatingData speaking,
    required RatingData vocabulary,
    required String comments,
  }) = _TutorLessonReviewModel;

  factory TutorLessonReviewModel.fromJson(Map<String, dynamic> json) =>
      _$TutorLessonReviewModelFromJson(json);
}
