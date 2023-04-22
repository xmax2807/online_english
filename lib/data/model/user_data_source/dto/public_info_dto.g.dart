// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$User_PublicInfoDTO _$$User_PublicInfoDTOFromJson(Map<String, dynamic> json) =>
    _$User_PublicInfoDTO(
      id: json['id'] as String,
      level: $enumDecodeNullable(_$LevelEnumMap, json['level']),
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
      isPublicRecord: json['isPublicRecord'] as bool?,
      courses: (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseOverviewDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$User_PublicInfoDTOToJson(
        _$User_PublicInfoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': _$LevelEnumMap[instance.level],
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'language': instance.language,
      'isPublicRecord': instance.isPublicRecord,
      'courses': instance.courses,
    };

const _$LevelEnumMap = {
  Level.BEGINNER: 'BEGINNER',
  Level.HIGHER_BEGINNER: 'HIGHER_BEGINNER',
  Level.PRE_INTERMEDIATE: 'PRE_INTERMEDIATE',
  Level.INTERMEDIATE: 'INTERMEDIATE',
  Level.UPPER_INTERMEDIATE: 'UPPER_INTERMEDIATE',
  Level.ADVANCED: 'ADVANCED',
  Level.PROFICIENCY: 'PROFICIENCY',
};
