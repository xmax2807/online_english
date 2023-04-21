// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_teacher_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeacherDetailDTO _$$_TeacherDetailDTOFromJson(Map<String, dynamic> json) =>
    _$_TeacherDetailDTO(
      video: json['video'] as String?,
      bio: json['bio'] as String,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      profession: json['profession'] as String?,
      interests: json['interests'] as String?,
      languages: json['languages'] as String?,
      specialties: json['specialties'] as String?,
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      totalFeedback: json['totalFeedback'] as int?,
      isFavorite: json['isFavorite'] as bool?,
      user: UserPublicInfoDTO.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeacherDetailDTOToJson(_$_TeacherDetailDTO instance) =>
    <String, dynamic>{
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'avgRating': instance.avgRating,
      'totalFeedback': instance.totalFeedback,
      'isFavorite': instance.isFavorite,
      'User': instance.user,
    };
