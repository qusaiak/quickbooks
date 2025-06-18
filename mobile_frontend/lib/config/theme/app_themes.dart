import 'package:QuickBooks/config/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../core/utils/gen/fonts.gen.dart';
import 'colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: FontFamily.poppins,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColor.bottomNavigationBarLight),
    primaryColor: AppColor.primaryColor,
    primaryColorLight: AppColor.primaryLight,
    primaryColorDark: AppColor.primaryDark,
    appBarTheme: appBarLightTheme(),
    bottomNavigationBarTheme: bottomNavigationBarThemeDataLight(),
    colorScheme: const ColorScheme.light(
      surfaceContainerHighest: AppColor.onBackgroundColorLight,
      brightness: Brightness.light,
      primary: AppColor.primaryLight,
      onPrimary: AppColor.onPrimaryLight,
      secondary: AppColor.secondaryLight,
      onSecondary: AppColor.onSecondaryLight,
      error: AppColor.errorLight,
      onError: AppColor.onErrorLight,
      surface: AppColor.surfaceLight,
      onSurface: AppColor.primaryColor,
      secondaryContainer: AppColor.gray100,
      onSurfaceVariant: AppColor.gray500,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: FontFamily.poppins,
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: AppColor.bottomNavigationBarLight,
    ),
    primaryColor: AppColor.primaryColor,
    primaryColorLight: AppColor.primaryLight,
    primaryColorDark: AppColor.primaryDark,
    appBarTheme: appBarDarkTheme(),
    bottomNavigationBarTheme: bottomNavigationBarThemeDataDark(),
    iconTheme: const IconThemeData(
      color: AppColor.primaryDark,
    ),
    colorScheme: const ColorScheme(
      surfaceContainerHighest: AppColor.secondaryBackgroundColorDark,
      brightness: Brightness.dark,
      primary: AppColor.primaryDark,
      onPrimary: AppColor.onPrimaryDark,
      secondary: AppColor.secondaryDark,
      onSecondary: AppColor.onSecondaryDark,
      error: AppColor.errorDark,
      onError: AppColor.onErrorDark,
      onSurface: AppColor.onSurfaceDark,
      surface: AppColor.backgroundColorDark,
      secondaryContainer: AppColor.gray900,
      onSurfaceVariant: AppColor.gray500,
    ),
  );
}

AppBarTheme appBarLightTheme() {
  return AppBarTheme(
    color: AppColor.backgroundColorLight,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: false,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: Styles.textStyle20
        .copyWith(backgroundColor: Colors.black, fontWeight: FontWeight.bold),
  );
}

AppBarTheme appBarDarkTheme() {
  return AppBarTheme(
    color: AppColor.backgroundColorDark,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: false,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: Styles.textStyle20
        .copyWith(backgroundColor: Colors.black, fontWeight: FontWeight.bold),
  );
}

BottomNavigationBarThemeData bottomNavigationBarThemeDataLight() {
  return BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Colors.white,
    selectedIconTheme: const IconThemeData(
      size: 22,
      color: AppColor.primaryColor,
    ),
    selectedLabelStyle: Styles.textStyle12,
    selectedItemColor: AppColor.primaryColor,
    unselectedIconTheme: const IconThemeData(
      size: 16,
      color: AppColor.gray500,
    ),
    unselectedItemColor: AppColor.gray500,
    unselectedLabelStyle: Styles.textStyle12,
  );
}

BottomNavigationBarThemeData bottomNavigationBarThemeDataDark() {
  return BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: AppColor.transparent,
    selectedIconTheme: const IconThemeData(
      size: 22,
      color: AppColor.primaryDark,
    ),
    selectedLabelStyle: Styles.textStyle12,
    selectedItemColor: AppColor.primaryDark,
    unselectedIconTheme: const IconThemeData(
      size: 16,
      color: AppColor.gray500,
    ),
    unselectedItemColor: AppColor.gray500,
    unselectedLabelStyle: Styles.textStyle12,
  );
}
