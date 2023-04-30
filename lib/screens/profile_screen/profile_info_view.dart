import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:online_english/screens/profile_screen/components/avatar_profile.dart';

import '../../services/profile_service.dart';

class ProfileInfoView extends ConsumerStatefulWidget {
  const ProfileInfoView({super.key});

  @override
  ConsumerState<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends ConsumerState<ProfileInfoView> {
  late final UserProfileService _service;
  Future<void> _handleImageChanged(String filePath) async {
    _service.updateAvatar(filePath);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = ref.read(userProfileService);
    _service.getProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = ref.watch(userProfileService).data;
    if (userProfile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AvatarProfile(
            dimension: 150,
            avatarUrl: userProfile.avatar,
            onChangeImage: _handleImageChanged),
      ],
    );
  }
}
