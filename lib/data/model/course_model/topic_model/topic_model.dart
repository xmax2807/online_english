import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_model.freezed.dart';
part 'topic_model.g.dart';

@freezed
abstract class TopicModel implements _$TopicModel {
  factory TopicModel({
    required String id,
    required String courseId,
    required int orderCourse,
    required String name,
    required String nameFile,
    required int? numberOfPages,
    required String description,
    required String? videoUrl,
  }) = _TopicModel;
  factory TopicModel.fromJson(Map<String, dynamic> json) =>
      _$TopicModelFromJson(json);
}
