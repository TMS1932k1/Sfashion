import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/config/themes/styles.dart';

class XTheme {
  static ThemeData light() => ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: MyColors.colorPrimary,
          onBackground: MyColors.colorBlack,
        ),
        textTheme: TextTheme(
          labelMedium: Style.labelMedium,
          bodyMedium: Style.bodyMedium,
        ),
      );
  static ThemeData dark() => ThemeData.dark();
}
