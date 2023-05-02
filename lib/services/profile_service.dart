import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';

import '../data/model/key_value_models/learn_topic_model.dart';
import '../data/model/key_value_models/test_preparation_model.dart';
import '../data/model/user_data_source/user_enum.dart';
import '../data/providers/profile_repos_provider.dart';
import '../data/repositories/profile_repository.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

final userProfileService = ChangeNotifierProvider.autoDispose(
    (ref) => UserProfileService(ref.read(profileReposProvider)));

class UserProfileService extends ChangeNotifier {
  final ProfileRepository _repos;

  UserProfileService(this._repos);

  UserModel? _data;
  UserModel? get data => _data;

  Future<void> getProfileInfo() async {
    _data = await _repos.getProfile();
    notifyListeners();
  }

  Future<void> updateAvatar(String filePath) async {
    String? avaUrl = await _repos.updateAvatar(filePath);
    if (avaUrl == null) return;

    _data = _data!.copyWith(avatar: avaUrl);
    notifyListeners();
  }

  Map<String, String>? _specialities;
  Map<String, String>? get specialities => _specialities;

  List<LearnTopicModel>? listTopics;
  List<TestPreparationModel>? listTests;

  Future<void> getMapSpecialties() async {
    listTopics = await _repos.getLearnTopics();
    listTests = await _repos.getTestPreparations();

    _specialities = {};
    if (listTopics != null) {
      for (var model in listTopics!) {
        if (!_specialities!.containsKey(model.key)) {
          _specialities![model.key] = model.name;
        }
      }
    }

    if (listTests != null) {
      for (var model in listTests!) {
        if (!_specialities!.containsKey(model.key)) {
          _specialities![model.key] = model.name;
        }
      }
    }

    notifyListeners();
  }

  Future<bool> updateProfile(
    String name,
    String phone,
    String country,
    DateTime birthday,
    List<String> specialties,
    String studySchedule,
    Level level,
  ) {
    List<String> learnTopicIds = [];
    List<String> testPreparationIds = [];

    for (String specialty in specialties) {
      final learnTopic =
          listTopics!.firstWhereOrNull((x) => x.key == specialty);
      if (learnTopic != null) {
        learnTopicIds.add(learnTopic.id.toString());
        continue;
      }

      final testPreparation =
          listTests!.firstWhereOrNull((x) => x.key == specialty);
      if (testPreparation != null) {
        testPreparationIds.add(testPreparation.id.toString());
        continue;
      }
    }

    Map<String, dynamic> info = {
      'name': name,
      'phone': phone,
      'country': country,
      'birthday': birthday.toStringFormat(format: 'yyyy-mm-dd'),
      'level': level.toValue(),
      'learnTopics': learnTopicIds,
      'testPreparations': testPreparationIds,
      'studySchedule': studySchedule,
    };
    return _repos.updateProfile(info);
  }
}
