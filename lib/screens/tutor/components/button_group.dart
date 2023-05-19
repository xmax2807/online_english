import 'package:flutter/material.dart';
import 'package:online_english/utils/theme/my_theme.dart';

import '../../../gen/assets.gen.dart';
import '../../shared_components/my_icon_button.dart';

class TutorButtonGroup extends StatelessWidget {
  final bool isFav;
  const TutorButtonGroup({super.key, required this.isFav});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyToggleButton(
          isOn: isFav,
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
