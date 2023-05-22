import 'package:flutter/material.dart';

class ThemeColors {
  static const scaffold = Color(0xFFFFFFFF);
  static const title = Color(0xFF263238);
  static const title2 = Color(0xFF78909C);
  static const srchint = Color(0x55263238);
}

class ThemeFonts {
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

  static const productTitle = TextStyle(
    fontSize: 14,
    color: ThemeColors.title,
    fontWeight: FontWeight.w600,
  );

  static const productDescr = TextStyle(
    fontSize: 14,
    color: ThemeColors.title2,
    fontWeight: FontWeight.w400,
  );

  static const productAddToCart = TextStyle(
    fontSize: 12,
    color: Color(0xFF2196F3),
    fontWeight: FontWeight.w700,
  );

  static const productDetailTitle = TextStyle(
    fontSize: 24,
    color: ThemeColors.title,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  static const productDetailPrice = TextStyle(
    fontSize: 20,
    color: ThemeColors.title,
    fontWeight: FontWeight.w700,
    fontFamily: 'Montserrat',
  );

  static const cyanButton = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    gradient: LinearGradient(
      colors: [Color(0xFF00BCD4), Color(0xFF00ACC1)],
      end: FractionalOffset(1, 0),
      begin: FractionalOffset(1, 1),
    ),
  );

  static const cyanButtonText = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const productDetailGray = TextStyle(
    fontSize: 18,
    color: ThemeColors.title2,
    fontWeight: FontWeight.w700,
  );

  static const AlsoLikePrice = TextStyle(
    fontSize: 16,
    color: ThemeColors.title2,
    fontWeight: FontWeight.w400,
    // fontFamily: "Roboto",
  );
}
