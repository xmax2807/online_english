import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_english/services/profile_service.dart';

import 'avatar_profile.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final UserProfileService service;
  final String avatar;
  final String name;
  final String id;
  const ProfileHeaderWidget(
      {super.key,
      required this.service,
      required this.avatar,
      required this.name,
      required this.id});

  Future<void> _handleImageChanged(String filePath) async {
    service.updateAvatar(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Row(
        children: [
          AvatarProfile(
            dimension: 125,
            avatarUrl: avatar,
            onChangeImage: _handleImageChanged,
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Text('Account ID: $id'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
