import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/course_model/category_model/category_model.dart';

part 'course_basic_dto.g.dart';

@JsonSerializable()
class CourseBasicDTO {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  @JsonKey(fromJson: _stringToInt, toJson: _stringFromInt)
  final int? level;
  final int courseLength;
  final List<CategoryModel> categories;

  CourseBasicDTO(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.courseLength,
    this.categories,
  );
  factory CourseBasicDTO.fromJson(Map<String, dynamic> json) =>
      _$CourseBasicDTOFromJson(json);

  static int? _stringToInt(String? number) =>
      number == null ? null : int.tryParse(number);
  static String? _stringFromInt(int? number) => number?.toString();

  CourseBasicDTO clone() {
    CategoryModel cloneCategory = categories[0].clone();
    return CourseBasicDTO(
        id, name, description, imageUrl, level, courseLength, [cloneCategory]);
  }
}
