import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user_data_source/user_enum.dart';
import 'category_key.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final String id;
  final String title;
  final String? description;
  final CategoryKey key;
  final int? displayOrder;

  CategoryModel(
    this.id,
    this.title,
    this.description,
    this.key,
    this.displayOrder,
  );
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryModel clone() =>
      CategoryModel(id, title, description, key, displayOrder);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (other is! CategoryModel) return false;
    return id == other.id;
  }
}
