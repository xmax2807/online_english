import 'package:flutter/material.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../../gen/assets.gen.dart';
import '../../shared_components/my_icon_button.dart';

class TutorButtonGroup extends StatelessWidget {
  const TutorButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyToggleButton(
          toggleOffIcon: Assets.myCustomIcons.hearts.heartOutline,
          toggleOnIcon: Assets.myCustomIcons.hearts.heartFill,
          label: "Favorites",
          toggleOnColor: MyTheme.colors.red,
        ),
        MyIconButton(
          iconPath: Assets.myCustomIcons.reportSvgrepoCom,
          label: "Report",
        ),
        MyIconButton(
          iconPath: Assets.myCustomIcons.star,
          label: "Review",
        ),
      ],
    );
  }
}
