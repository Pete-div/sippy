// base theme
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sippy/utils/colors.dart';

import 'constants/app_colors.dart';

class AppTheme {
  static const _montserrat = 'Montserrat';
  static TextStyle _createInterTextStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: _montserrat,
      letterSpacing: letterSpacing,
    );
  }

  static TextTheme _createTextTheme({
    Color color = Colors.black,
  }) {
    return TextTheme(
      displayLarge: _createInterTextStyle(
        fontSize: 64.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: _createInterTextStyle(
          fontSize: 48.0, fontWeight: FontWeight.bold, color: color),
      displaySmall: _createInterTextStyle(
          fontSize: 36.0, fontWeight: FontWeight.bold, color: color),
      headlineLarge: _createInterTextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: color),
      headlineMedium: _createInterTextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w400, color: color),
      headlineSmall: _createInterTextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: color),
      titleLarge: _createInterTextStyle(
          fontSize: 22.0, fontWeight: FontWeight.w500, color: color),
      titleMedium: _createInterTextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: color),
      titleSmall: _createInterTextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: AppColors.greyColor.shade50,
      ),
      bodyLarge: _createInterTextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w400, color: color),
      bodyMedium: _createInterTextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w400, color: color),
      bodySmall: _createInterTextStyle(
          fontSize: 14.0, fontWeight: FontWeight.w400, color: color),
      labelLarge: _createInterTextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
      labelMedium: _createInterTextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
      labelSmall: _createInterTextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: 0.2,
      ),
    );
  }

  static OutlinedButtonThemeData createOutlinedButtonThemeData(
      Color foregroundColor) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        side: BorderSide.none,
        alignment: Alignment.center,
      ),
    );
  }

  static ElevatedButtonThemeData createElevatedButtonThemeData(
      Color backgroundColor, Color foregroundColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: foregroundColor,
            fontFamily: _montserrat,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  static BottomNavigationBarThemeData createBottomNavigationBarThemeData(
    Color backgroundColor,
    Color selectedIconColor,
    Color unselectedLabelColor,
    Color selectedLabelColor,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: selectedIconColor,
      ),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: unselectedLabelColor,
      unselectedLabelStyle: const TextStyle(
        fontFamily: _montserrat,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      selectedLabelStyle: const TextStyle(
        color: Colors.amber,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      selectedItemColor: selectedLabelColor,
    );
  }

  static IconThemeData createIconThemeData(Color color) {
    return IconThemeData(
      color: color,
    );
  }

  static ThemeData light({required bool material3}) {
    return ThemeData.light().copyWith(
      dialogBackgroundColor: AppColors.greyColor.shade50,
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.greyColor.shade50,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      colorScheme: ColorScheme.light(
        background: AppColors.greyColor.shade50,
        primary: AppColors.primaryColor,
        onSecondary: AppColors.greyColor,
        onPrimary: Colors.black, // header text color
        onSurface: AppColors.greyColor,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.greyColor.shade50,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
        backgroundColor: AppColors.greyColor.shade50,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
      ),
      iconTheme: createIconThemeData(AppColors.greyColor.shade50),
      scaffoldBackgroundColor: AppColors.greyColor.shade50,
      textTheme: _createTextTheme(),
      outlinedButtonTheme:
          createOutlinedButtonThemeData(AppColors.primaryColor),
      elevatedButtonTheme: createElevatedButtonThemeData(
        AppColors.primaryColor,
        AppColors.greyColor.shade50,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: _createInterTextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
      ),
      bottomNavigationBarTheme: createBottomNavigationBarThemeData(
        AppColors.greyColor.shade50,
        Colors.black,
        AppColors.greyColor.shade600,
        AppColors.primaryColor.shade600,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.greyColor.shade50,
        modalBackgroundColor: AppColors.greyColor.shade50,
      ),
      tabBarTheme: TabBarTheme(
        dividerColor: appColors.transparent,
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.greyColor.shade600,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: appColors.primary,
        labelColor: appColors.primary,
        unselectedLabelColor: appColors.grey,
      ),
    );
  }
}
