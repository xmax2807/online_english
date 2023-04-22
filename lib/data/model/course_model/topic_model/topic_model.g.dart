// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicModel _$$_TopicModelFromJson(Map<String, dynamic> json) =>
    _$_TopicModel(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      orderCourse: json['orderCourse'] as int,
      name: json['name'] as String,
      nameFile: json['nameFile'] as String,
      numberOfPages: json['numberOfPages'] as int?,
      description: json['description'] as String,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$$_TopicModelToJson(_$_TopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'orderCourse': instance.orderCourse,
      'name': instance.name,
      'nameFile': instance.nameFile,
      'numberOfPages': instance.numberOfPages,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
    };
