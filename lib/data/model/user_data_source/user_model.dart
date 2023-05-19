import 'package:freezed_annotation/freezed_annotation.dart';

import '../key_value_models/learn_topic_model.dart';
import '../key_value_models/test_preparation_model.dart';
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
    required List<LearnTopicModel> learnTopics,
    required List<TestPreparationModel> testPreparations,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
