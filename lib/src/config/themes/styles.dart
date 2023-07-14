import 'package:flutter/material.dart';
import 'package:s_fashion/src/config/themes/my_colors.dart';
import 'package:s_fashion/src/constants/fonts.dart';

class Style {
  static TextStyle styleLogo = const TextStyle(
    fontFamily: Font.dancingScript,
    fontWeight: FontWeight.w700,
  );

  static TextStyle labelMedium = const TextStyle(
    fontFamily: Font.openSansCondensed,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle labelSmall = const TextStyle(
    fontFamily: Font.openSansCondensed,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontFamily: Font.openSansCondensed,
    fontSize: 18,
  );

  static TextStyle bodySmall = const TextStyle(
    fontFamily: Font.openSansCondensed,
    fontSize: 16,
  );
}
