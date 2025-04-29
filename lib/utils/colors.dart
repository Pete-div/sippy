// app colors
import 'package:flutter/material.dart';

const appColors = ThemeModel(
  primary: Color(0xFF01A985),
  secondary: Color(0xFFF0A92B),
  darkSecondary: Color(0xFFB86C0F),
  lighterPrimary: Color(0xFFC1F297),
  armyGreen: Color(0xFF0B4D40),
  lightPrimary: Color(0xFFA5CF61),
  lightestPrimary: Color(0xFFF7FBF1),
  splashGreen: Color(0xffBCEF95),
  darkPrimary: Color(0xFF008067),
  darkerPrimary: Color(0xFF079460),
  darkestPrimary: Color(0xff0A4C3E),
  lightDarkPrimary: Color(0xFF94C740),
  lightSecondary: Color(0xFFFDF6EA),
  lighterSecondary: Color(0xFFE09500),
  darkGrey: Color(0xFF282828),
  black282828: Color(0xFF282828),
  black7A7A7A: Color(0xFF7A7A7A),
  blackBFBFBF: Color(0xFFBFBFBF),
  blackEBEBEB: Color(0xFFEBEBEB),
  black4F4F4F: Color(0xFF4F4F4F),
  black434343: Color(0xFF434343),
  danger: Color(0xFFE25A51),
  lightRed: Color(0xFFFFEDED),
  success: Color(0xFF197527),
  icon: Color(0xFF282828),
  nav: Color(0xFFCACACA),
  grey: Color(0xFF7A7A7A),
  greyFBFCFC: Color(0xFFFBFCFC),
  lightGrey: Color(0xFFEBEBEB),
  lighterGrey: Color(0xFFF4F4F4),
  background: Color(0xFFFBFBFB),
  background2: Color(0xFFF4F4F4),
  black: Colors.black,
  white: Colors.white,
  transparent: Colors.transparent,
  textFieldFill: Color(0xFFE5F2F0),
  pink: Color(0xFFF08F5D),
  lighterGreen: Color(0xFF9EE074),
  lightestGreen: Color(0XFFEAF8E0),
  brown: Color(0xFF732223),
  aiLightGreen: Color(0xffb2dece),
  aiLightPink: Color(0xffffc628),
  aiLightRed: Color(0xffffc8c8),
  aiDeepGreen: Color(0xff056c45),
  aiDeepPink: Color(0xffbf951e),
  aiDeepRed: Color(0xffbf3938),
);

// theme model
class ThemeModel {
  const ThemeModel({
    required this.primary,
    required this.darkPrimary,
    required this.lightPrimary,
    required this.darkerPrimary,
    required this.darkestPrimary,
    required this.lighterPrimary,
    required this.lightestPrimary,
    required this.lightDarkPrimary,
    required this.secondary,
    required this.lighterGreen,
    required this.lightestGreen,
    required this.darkSecondary,
    required this.lightSecondary,
    required this.lighterSecondary,
    required this.black282828,
    required this.black7A7A7A,
    required this.blackBFBFBF,
    required this.blackEBEBEB,
    required this.black4F4F4F,
    required this.black434343,
    required this.splashGreen,
    required this.armyGreen,
    required this.danger,
    required this.lightRed,
    required this.success,
    required this.icon,
    required this.nav,
    required this.white,
    required this.black,
    required this.grey,
    required this.greyFBFCFC,
    required this.darkGrey,
    required this.lightGrey,
    required this.lighterGrey,
    required this.background,
    required this.background2,
    required this.transparent,
    required this.textFieldFill,
    required this.pink,
    required this.brown,
    required this.aiLightGreen,
    required this.aiLightPink,
    required this.aiLightRed,
    required this.aiDeepGreen,
    required this.aiDeepPink,
    required this.aiDeepRed,
  });

  final Color primary;
  final Color secondary;

  // primary shades
  final Color lighterPrimary;
  final Color lightPrimary;
  final Color lightestPrimary;
  final Color darkPrimary;
  final Color darkerPrimary;
  final Color darkestPrimary;
  final Color lightDarkPrimary;
  final Color lighterGreen;
  final Color lightestGreen;

  // secondary shades
  final Color darkSecondary;
  final Color lightSecondary;
  final Color lighterSecondary;

  final Color splashGreen;
  final Color armyGreen;

  final Color black282828;
  final Color black7A7A7A;
  final Color blackBFBFBF;
  final Color black4F4F4F;
  final Color blackEBEBEB;
  final Color black434343;

  final Color danger;
  final Color lightRed;
  final Color success;
  final Color icon;
  final Color nav;
  final Color grey;
  final Color greyFBFCFC;
  final Color lightGrey;
  final Color lighterGrey;
  final Color background;
  final Color background2;
  final Color darkGrey;
  final Color textFieldFill;
  final Color pink;

  final Color white;
  final Color black;
  final Color brown;
  final Color transparent;
  final Color aiLightGreen;
  final Color aiLightPink;
  final Color aiLightRed;
  final Color aiDeepGreen;
  final Color aiDeepPink;
  final Color aiDeepRed;
}

const List<Color> myCirclesColors = [
  Color(0xFFF7FBF1),
  Color(0xFFE5F2F0),
  Color(0xFFF4F4F4),
];
