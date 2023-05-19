import 'package:freezed_annotation/freezed_annotation.dart';
part 'specialty_model.g.dart';

@JsonSerializable()
class SpecialtyModel {
  final String id;
  final String key;
  final String englishName;
  final String vietnameseName;

  SpecialtyModel(
    this.id,
    this.key,
    this.englishName,
    this.vietnameseName,
  );

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyModelFromJson(json);
}
