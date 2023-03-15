// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingData _$$_RatingDataFromJson(Map<String, dynamic> json) =>
    _$_RatingData(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$_RatingDataToJson(_$_RatingData instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };
