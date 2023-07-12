import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/styles.dart';

class XTheme {
  static ThemeData light() => ThemeData.light().copyWith(
        textTheme: Style.textTheme(),
      );
  static ThemeData dark() => ThemeData.dark().copyWith(
        textTheme: Style.textTheme(),
      );
}
