// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['imageUrl'] as String?,
      CourseModel._stringToInt(json['level'] as String?),
      json['reason'] as String?,
      json['purpose'] as String?,
      json['visible'] as bool?,
      (json['topics'] as List<dynamic>)
          .map((e) => TopicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['users'] as List<dynamic>)
          .map((e) => BasicTeacherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': CourseModel._stringFromInt(instance.level),
      'reason': instance.reason,
      'purpose': instance.purpose,
      'visible': instance.visible,
      'topics': instance.topics,
      'users': instance.users,
    };
