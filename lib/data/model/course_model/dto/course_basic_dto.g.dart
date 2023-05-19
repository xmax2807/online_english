// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseBasicDTO _$CourseBasicDTOFromJson(Map<String, dynamic> json) =>
    CourseBasicDTO(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['imageUrl'] as String?,
      CourseBasicDTO._stringToInt(json['level'] as String?),
      json['courseLength'] as int,
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseBasicDTOToJson(CourseBasicDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': CourseBasicDTO._stringFromInt(instance.level),
      'courseLength': instance.courseLength,
      'categories': instance.categories,
    };
