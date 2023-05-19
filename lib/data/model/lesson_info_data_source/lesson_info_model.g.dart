// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonModel _$$_LessonModelFromJson(Map<String, dynamic> json) =>
    _$_LessonModel(
      id: json['id'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_LessonModelToJson(_$_LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
