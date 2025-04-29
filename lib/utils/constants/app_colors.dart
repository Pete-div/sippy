import 'package:flutter/material.dart' show MaterialColor, Color;
import 'package:sippy/utils/constants/as_html_color_to_color.dart';

class AppColors {
  static Color black = '#000000'.htmlColorToColor();
  static Color white='FFFFFFF'.htmlColorToColor();
  static Color youngRanchersPrimary = '10AB72'.htmlColorToColor();
  static Color deepOnboardGreen = const Color(0xFF11312b);
  static MaterialColor primaryColor = MaterialColor(
    0xFF079460,
    <int, Color>{
      50: '#E6F4EF'.htmlColorToColor(), // Light
      100: '#DAEFE7'.htmlColorToColor(), // Light :hover
      200: '#B2DECE'.htmlColorToColor(), // Light :active
      300: '#079460'.htmlColorToColor(), // Normal
      400: '#068556'.htmlColorToColor(), // Normal :hover
      500: '#06764D'.htmlColorToColor(), // Normal :active
      600: '#056F48'.htmlColorToColor(), // Dark
      700: '#04593A'.htmlColorToColor(), // Dark :hover
      800: '#03432B'.htmlColorToColor(), // Dark :active
      900: '#023422'.htmlColorToColor(), // Darker
    },
  );

  static MaterialColor secondaryColor = MaterialColor(
    0xFF056C45,
    <int, Color>{
      50: '#E6F0EC'.htmlColorToColor(), // Light
      100: '#DAE9E3'.htmlColorToColor(), // Light :hover
      200: '#B2D1C5'.htmlColorToColor(), // Light :active
      300: '#056C45'.htmlColorToColor(), // Normal
      400: '#05613E'.htmlColorToColor(), // Normal :hover
      500: '#045137'.htmlColorToColor(), // Normal :active
      600: '#034129'.htmlColorToColor(), // Dark
      700: '#02311F'.htmlColorToColor(), // Dark :hover
      800: '#022618'.htmlColorToColor(), // Dark :active
      900: '#022618'.htmlColorToColor(), // Darker
    },
  );

  static MaterialColor accentColor = MaterialColor(
    0xFF9ee074,
    <int, Color>{
      50: '#f5fcf1'.htmlColorToColor(), // Light
      100: '#f0faea'.htmlColorToColor(), // Light :hover
      200: '#e1f5d4'.htmlColorToColor(), // Light :active
      300: '#9ee074'.htmlColorToColor(), // Normal
      400: '#8eca68'.htmlColorToColor(), // Normal :hover
      500: '#7eb35d'.htmlColorToColor(), // Normal :active
      600: '#77a857'.htmlColorToColor(), // Dark
      700: '#5f8646'.htmlColorToColor(), // Dark :hover
      800: '#476534'.htmlColorToColor(), // Dark :active
      900: '#374e29'.htmlColorToColor(), // Darker
    },
  );

  static MaterialColor greyColor = MaterialColor(
    0xFFfbfbfb,
    <int, Color>{
      50: '#ffffff'.htmlColorToColor(), // Light
      100: '#fefefe'.htmlColorToColor(), // Light :hover
      200: '#fefefe'.htmlColorToColor(), // Light :active
      300: '#fbfbfb'.htmlColorToColor(), // Normal
      400: '#e2e2e2'.htmlColorToColor(), // Normal :hover
      500: '#c9c9c9'.htmlColorToColor(), // Normal :active
      600: '#bcbcbc'.htmlColorToColor(), // Dark
      700: '#979797'.htmlColorToColor(), // Dark :hover
      800: '#717171'.htmlColorToColor(), // Dark :active
      900: '#585858'.htmlColorToColor(), // Darker
    },
  );

  static MaterialColor infoColor = MaterialColor(
    0xFFffc628,
    <int, Color>{
      50: '#fff9ea'.htmlColorToColor(),
      100: '#fff6df'.htmlColorToColor(),
      200: '#ffedbc'.htmlColorToColor(),
      300: '#ffc628'.htmlColorToColor(),
      400: '#e6b224'.htmlColorToColor(),
      500: '#cc9e20'.htmlColorToColor(),
      600: '#bf951e'.htmlColorToColor(),
      700: '#997718'.htmlColorToColor(),
      800: '#735912'.htmlColorToColor(),
      900: '#59450e'.htmlColorToColor(),
    },
  );

  static MaterialColor errorColor = MaterialColor(
    0xFFff4c4d,
    <int, Color>{
      50: '#ffeded'.htmlColorToColor(), // Light
      100: '#ffe4e4'.htmlColorToColor(), // Light :hover
      200: '#ffc8c8'.htmlColorToColor(), // Light :active
      300: '#ff4c4d'.htmlColorToColor(), // Normal
      400: '#cc3d3e'.htmlColorToColor(), // Normal :hover
      500: '#992e3e'.htmlColorToColor(), // Normal :active
      600: '#591b1b'.htmlColorToColor(), // Dark
      700: '#4c0444'.htmlColorToColor(), // Dark :hover
      800: '#372929'.htmlColorToColor(), // Dark :active
      900: '#2e1b1b'.htmlColorToColor(), // Darker
    },
  );

  static final AppColors _instance = AppColors._internal();
  factory AppColors() => _instance;
  AppColors._internal();
}
