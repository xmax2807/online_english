import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/course_model/topic_model/topic_model.dart';

import '../tutor_model/dto/basic_teacher_info.dart';

part 'course_model.g.dart';

@JsonSerializable()
class CourseModel {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  @JsonKey(fromJson: _stringToInt, toJson: _stringFromInt)
  final int? level;
  final String? reason;
  final String? purpose;
  final bool? visible;
  final List<TopicModel> topics;
  final List<BasicTeacherInfo> users;
  CourseModel(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.visible,
    this.topics,
    this.users,
  );
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  static int? _stringToInt(String? number) =>
      number == null ? null : int.tryParse(number);
  static String? _stringFromInt(int? number) => number?.toString();
}
