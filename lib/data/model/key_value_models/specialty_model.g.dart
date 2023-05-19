// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialtyModel _$SpecialtyModelFromJson(Map<String, dynamic> json) =>
    SpecialtyModel(
      json['id'] as String,
      json['key'] as String,
      json['englishName'] as String,
      json['vietnameseName'] as String,
    );

Map<String, dynamic> _$SpecialtyModelToJson(SpecialtyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'englishName': instance.englishName,
      'vietnameseName': instance.vietnameseName,
    };
