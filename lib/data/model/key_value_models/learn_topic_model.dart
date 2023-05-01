import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class LearnTopicModel {
  final String id;
  final String key;
  final String name;

  LearnTopicModel(
    this.id,
    this.key,
    this.name,
  );

  factory LearnTopicModel.fromJson(Map<String, dynamic> json) =>
      LearnTopicModel(json['id'], json['key'], json['name']);
}
