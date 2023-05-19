// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_teacher_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeacherOverviewDTO _$$_TeacherOverviewDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TeacherOverviewDTO(
      avatar: json['avatar'] as String? ?? '',
      name: json['name'] as String,
      country: json['country'] as String? ?? 'VN',
      id: json['id'] as String,
      userId: json['userId'] as String,
      bio: json['bio'] as String,
      specialties: json['specialties'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      isfavoritetutor: json['isfavoritetutor'] as String?,
    );

Map<String, dynamic> _$$_TeacherOverviewDTOToJson(
        _$_TeacherOverviewDTO instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'id': instance.id,
      'userId': instance.userId,
      'bio': instance.bio,
      'specialties': instance.specialties,
      'rating': instance.rating,
      'isfavoritetutor': instance.isfavoritetutor,
    };
