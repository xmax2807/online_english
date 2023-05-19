import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_data.freezed.dart';
part 'rating_data.g.dart';

@freezed
abstract class RatingData implements _$RatingData {
  factory RatingData(
      {required String label,
      required double value,
      required String comment}) = _RatingData;
  factory RatingData.fromJson(Map<String, dynamic> json) =>
      _$RatingDataFromJson(json);
}
