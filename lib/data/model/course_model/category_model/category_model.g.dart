// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['id'] as String,
      json['title'] as String,
      json['description'] as String?,
      $enumDecode(_$CategoryKeyEnumMap, json['key']),
      json['displayOrder'] as int?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'key': _$CategoryKeyEnumMap[instance.key]!,
      'displayOrder': instance.displayOrder,
    };

const _$CategoryKeyEnumMap = {
  CategoryKey.TRAVEL: 'TRAVEL',
  CategoryKey.BUSINESS: 'BUSINESS',
  CategoryKey.KID: 'KID',
  CategoryKey.BEGINNER: 'BEGINNER',
};
