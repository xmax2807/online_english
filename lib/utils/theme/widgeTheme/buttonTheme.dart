import 'package:flutter/material.dart';

import '../my_theme.dart';

class MyButtonTheme {
  static const colors = AppColors();
  static final ButtonStyle baseButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(50, 50),
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  );
  static final ButtonStyle flatButtonStyle = baseButtonStyle.copyWith(
    backgroundColor: MaterialStatePropertyAll(colors.primaryColor),
    foregroundColor: MaterialStatePropertyAll(colors.onPrimaryColor),
  );
  static final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    surfaceTintColor: colors.secondaryColor,
    foregroundColor: colors.secondaryColor,
    side: BorderSide(color: colors.secondaryColor, width: 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    ),
  ).merge(baseButtonStyle);
  static final ButtonStyle iconButtonStyle = IconButton.styleFrom(
    shape: CircleBorder(
      side: BorderSide(color: colors.secondaryColor),
      eccentricity: 1.0,
    ),
    hoverColor: Colors.transparent,
    //padding: const EdgeInsets.all(8),
  );
  static final ButtonStyle tagButtonStyle = TextButton.styleFrom(
    minimumSize: const Size(50, 30),
    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
    backgroundColor: const Color(0xFFD7D7D7),
    foregroundColor: colors.primaryColor,
  ).merge(baseButtonStyle);

  static final ButtonStyle textOnlyStyle = ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(colors.primaryColor),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent))
      .merge(tagButtonStyle);
}
