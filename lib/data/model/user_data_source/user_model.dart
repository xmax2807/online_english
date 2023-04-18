import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_enum.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String email,
    required String name,
    required String avatar,
    required String? country,
    required String phone,
    required String? language,
    required DateTime? birthday,
    required bool isActivated,
    required String? requireNote,
    required Level? level,
    required bool isPhoneActivated,
    required int? timezone,
    required String? studySchedule,
    required bool canSendMessage,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
