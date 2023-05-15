import 'package:flutter/material.dart';

class ThemeColors
{
  static const scaffold = Color(0xFFFFFFFF);
  static const title = Color(0xFF263238);
  static const title2 = Color(0xFF78909C);
  static const srchint = Color(0x55263238);
}

class ThemeFonts
{
  static const r16 = TextStyle(
    fontSize: 16,
    color: ThemeColors.title,
    fontWeight: FontWeight.w700,
    height: 1.1,

  );
  static const r22 = TextStyle(
    fontSize: 22,
    color: ThemeColors.title2,
    fontWeight: FontWeight.w700,
  );

  static const sorts = TextStyle(
    fontSize: 14,
    color: ThemeColors.title2,
    fontWeight: FontWeight.w700,
  );

}
