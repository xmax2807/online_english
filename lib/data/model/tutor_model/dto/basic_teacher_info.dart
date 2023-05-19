import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class BasicTeacherInfo {
  String id;
  String name;
  String avatar;
  String country;
  BasicTeacherInfo({
    required this.id,
    required this.name,
    required this.avatar,
    required this.country,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'country': country,
    };
  }

  factory BasicTeacherInfo.fromJson(Map<String, dynamic> json) {
    return BasicTeacherInfo(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
    );
  }
}
