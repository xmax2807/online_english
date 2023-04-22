import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class BasicTeacherInfo {
  String id;
  String name;
  String avatar;
  BasicTeacherInfo({
    required this.id,
    required this.name,
    required this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }

  factory BasicTeacherInfo.fromJson(Map<String, dynamic> json) {
    return BasicTeacherInfo(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
