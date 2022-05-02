import 'package:films_app_trainee_task/features/theme/colors.dart';

import 'package:flutter/material.dart';

//ignore: avoid_classes_with_only_static_members
class MoviesAppTheme {
  static ThemeData get lightTheme {
    final _themeData = ThemeData.light();
    final _textTheme = _themeData.textTheme;

    return ThemeData.light().copyWith(
      splashColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.lightAliceBlue,
      appBarTheme: _appBarTheme(),
      floatingActionButtonTheme:
          _floatingActionButtonThemeData(color: AppColors.supernova),
      elevatedButtonTheme: _elevatedButtonThemeData(color: AppColors.supernova),
      textTheme: _textTheme.copyWith(
        headlineLarge: headlineStyle(color: AppColors.white, fontSize: 30.0),
        headline2: headlineStyle(color: AppColors.blackRock, fontSize: 20.0),
        headline3: headlineStyle(color: AppColors.darkRed, fontSize: 20.0),
        headline1: hintStyle(color: AppColors.lightGrey, fontSize: 18.0),
        headline4: _textStyle(color: AppColors.lightGrey, fontSize: 14),
        headline5: _textStyle(color: AppColors.aliceBlue, fontSize: 14),
        headline6:
            headlineStyle(color: AppColors.bakersChocolate, fontSize: 14.0),
        bodyText1: _textStyle(color: AppColors.gunPowder, fontSize: 16),
        bodyText2: _textStyle(color: AppColors.gunPowder, fontSize: 12),
        subtitle1: _textStyle(color: AppColors.white, fontSize: 18),
        subtitle2: headlineStyle(color: AppColors.sanMarino, fontSize: 18),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonThemeData({
    required Color color,
  }) {
    return FloatingActionButtonThemeData(
      backgroundColor: color,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData({
    required Color color,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static TextStyle headlineStyle({
    required Color color,
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'SanFrancisco',
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle hintStyle({
    required Color color,
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'SanFrancisco',
      fontStyle: FontStyle.italic,
      color: color,
    );
  }

  static TextStyle _textStyle({
    required Color color,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'SanFrancisco',
      color: color,
      fontSize: fontSize,
    );
  }
}
