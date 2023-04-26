import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class LessonStatus {
  final int id;
  final String status;

  LessonStatus(this.id, this.status);

  factory LessonStatus.fromJson(Map<String, dynamic> json) {
    return LessonStatus(json['id'], json['status']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'status': status};
}
