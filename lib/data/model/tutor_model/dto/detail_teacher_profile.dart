import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user_data_source/dto/public_info_dto.dart';

part 'detail_teacher_profile.freezed.dart';
part 'detail_teacher_profile.g.dart';

@freezed
abstract class TeacherDetailDTO implements _$TeacherDetailDTO {
  factory TeacherDetailDTO({
    required String? video,
    required String bio,
    required String? education,
    required String? experience,
    required String? profession,
    required String? interests,
    required String? languages,
    required String? specialties,
    required double? avgRating,
    required int? totalFeedback,
    required bool? isFavorite,
    @JsonKey(name: "User") required UserPublicInfoDTO user,
  }) = _TeacherDetailDTO;
  factory TeacherDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailDTOFromJson(json);
}
