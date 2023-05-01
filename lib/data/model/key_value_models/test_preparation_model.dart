import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class TestPreparationModel {
  final String id;
  final String key;
  final String name;

  TestPreparationModel(
    this.id,
    this.key,
    this.name,
  );

  factory TestPreparationModel.fromJson(Map<String, dynamic> json) =>
      TestPreparationModel(json['id'], json['key'], json['name']);
}
