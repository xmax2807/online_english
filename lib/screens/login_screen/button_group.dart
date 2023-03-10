import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme/my_theme.dart';

class MyIconButtonGroup extends StatefulWidget {
  final List<String> svgs;
  const MyIconButtonGroup({
    super.key,
    required this.svgs,
  });
  @override
  State<StatefulWidget> createState() => MyIconButtonGroupState();
}

class MyIconButtonGroupState extends State<MyIconButtonGroup> {
  List<String> get svgAssets => widget.svgs;

  final Decoration decoration = BoxDecoration(
    border: Border.all(color: MyTheme.colors.secondaryColor, width: 1.0),
    shape: BoxShape.circle,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (String svg in svgAssets)
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
