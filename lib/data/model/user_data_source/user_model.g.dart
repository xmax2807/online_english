// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      country: json['country'] as String?,
      phone: json['phone'] as String,
      language: json['language'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.tryParse(json['birthday'] as String),
      isActivated: json['isActivated'] as bool,
      requireNote: json['requireNote'] as String?,
      level: $enumDecodeNullable(_$LevelEnumMap, json['level']),
      isPhoneActivated: json['isPhoneActivated'] as bool,
      timezone: json['timezone'] as int?,
      studySchedule: json['studySchedule'] as String?,
      canSendMessage: json['canSendMessage'] as bool,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday?.toIso8601String(),
      'isActivated': instance.isActivated,
      'requireNote': instance.requireNote,
      'level': _$LevelEnumMap[instance.level],
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
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
