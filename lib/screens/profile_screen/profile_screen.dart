import 'package:flutter/material.dart';
import 'package:online_english/screens/profile_screen/profile_info_view.dart';

import '../../utils/theme/my_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.settings,
              color: MyTheme.colors.onPrimaryColor,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(child: ProfileInfoView()),
    );
  }
}
