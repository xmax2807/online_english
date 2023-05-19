import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:online_english/data/model/user_data_source/user_enum.dart';

import '../../course_model/dto/course_overview_dto.dart';

part 'public_info_dto.freezed.dart';
part 'public_info_dto.g.dart';

@freezed
class UserPublicInfoDTO with _$UserPublicInfoDTO {
  factory UserPublicInfoDTO({
    required String id,
    required Level? level,
    required String? avatar,
    required String? name,
    required String? country,
    required String? language,
    required bool? isPublicRecord,
    @JsonKey(name: 'courses') required List<CourseOverviewDTO>? courses,
  }) = User_PublicInfoDTO;
  factory UserPublicInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserPublicInfoDTOFromJson(json);
}
