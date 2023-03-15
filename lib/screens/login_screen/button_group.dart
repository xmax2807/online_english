import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme/my_theme.dart';

class MyIconButtonGroup extends StatelessWidget {
  final List<String> svgs;
  const MyIconButtonGroup({
    super.key,
    required this.svgs,
  });

  static Decoration decoration = BoxDecoration(
    border: Border.all(color: MyTheme.colors.secondaryColor, width: 1.0),
    shape: BoxShape.circle,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (String svg in svgs)
          Container(
            decoration: decoration,
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  svg,
                  fit: BoxFit.contain,
                )),
          ),
      ],
    );
  }
}
