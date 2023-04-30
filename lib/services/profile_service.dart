import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/data/model/user_data_source/user_model.dart';

import '../data/providers/profile_repos_provider.dart';
import '../data/repositories/profile_repository.dart';

final userProfileService = ChangeNotifierProvider(
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
}
