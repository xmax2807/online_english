import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class MyButton {
  Widget onCreateButton(BuildContext context);
}

class MyIconButton extends StatefulWidget {
  final String? label;
  final String iconPath;
  final double iconSize;
  final Color? color;
  final void Function()? callback;
  const MyIconButton(
      {super.key,
      this.label,
      required this.iconPath,
      this.iconSize = 24,
      this.callback,
      this.color});

  @override
  State<MyIconButton> createState() => _MyIconButtonState<MyIconButton>();
}

class MyToggleButton extends MyIconButton {
  final String toggleOnIcon;
  final Color? toggleOnColor;
  const MyToggleButton(
      {super.key,
      required String toggleOffIcon,
      required this.toggleOnIcon,
      this.toggleOnColor,
      super.label,
      super.iconSize,
      Color? toggleOffColor})
      : super(iconPath: toggleOffIcon, color: toggleOffColor);
  @override
  State<MyIconButton> createState() => _MyToggleButtonState();
}

class _MyIconButtonState<T extends MyIconButton> extends State<T> {
  Color getColor() => widget.color ?? Theme.of(context).colorScheme.primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        onCreateButton(context),
        if (widget.label != null)
          Text(
            widget.label!,
            style: TextStyle(color: getColor()),
          ),
      ],
    );
  }

  Widget onCreateButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.callback!();
        },
        icon: SvgPicture.asset(widget.iconPath,
            colorFilter: ColorFilter.mode(getColor(), BlendMode.srcIn)));
  }
}

class _MyToggleButtonState extends _MyIconButtonState<MyToggleButton> {
  bool isOn = false;
  Color get toggleOffColor =>
      widget.color ?? Theme.of(context).colorScheme.primary;
  Color get toggleOnColor =>
      widget.toggleOnColor ?? Theme.of(context).colorScheme.primary;

  @override
  Color getColor() {
    return isOn ? toggleOnColor : toggleOffColor;
  }

  @override
  Widget onCreateButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isOn = !isOn;
          });
        },
        icon: SvgPicture.asset(isOn ? widget.toggleOnIcon : widget.iconPath,
            colorFilter: ColorFilter.mode(getColor(), BlendMode.srcIn)));
  }
}
