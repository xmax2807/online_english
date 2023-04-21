import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview_teacher_profile.freezed.dart';
part 'overview_teacher_profile.g.dart';

@freezed
class TeacherOverviewDTO with _$TeacherOverviewDTO {
  factory TeacherOverviewDTO({
    @Default('') String avatar,
    required String name,
    @Default('VN') String country,
    required String id,
    required String userId,
    required String bio,
    required String specialties,
    required double? rating,
    required String? isfavoritetutor,
  }) = _TeacherOverviewDTO;
  factory TeacherOverviewDTO.fromJson(Map<String, dynamic> json) =>
      _$TeacherOverviewDTOFromJson(json);
}
