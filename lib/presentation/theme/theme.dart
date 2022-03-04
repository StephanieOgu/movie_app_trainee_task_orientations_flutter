import 'package:flutter/material.dart';
import 'colors.dart';

class MoviesAppTheme {
  static ThemeData get lightTheme {
    final _themeData = ThemeData.light();
    final _textTheme = _themeData.textTheme;

    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: _appBarTheme(),
        floatingActionButtonTheme:
            _floatingActionButtonThemeData(AppColors.supernova),
        elevatedButtonTheme: _elevatedButtonThemeData(AppColors.supernova),
        cardTheme: _cardTheme(),
        splashColor: AppColors.white,
        textTheme: _textTheme.copyWith(
          headline1: _textStyle(AppColors.blackRock, 24),
          headline2: _textStyle(AppColors.blackRock, 20),
          headline3: _textStyle(AppColors.blackRock, 18),
          headline4: _textStyle(AppColors.lightGrey, 14),
          headline5: _textStyle(AppColors.aliceBlue, 14),
          headline6: _textStyle(AppColors.careyPink, 14),
          bodyText1: _textStyle(AppColors.gunPowder, 16),
          bodyText2: _textStyle(AppColors.gunPowder, 12),
          subtitle1: _textStyle(AppColors.sanMarino, 18),
          subtitle2: _textStyle(AppColors.oasis, 14),
        ));
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(color: AppColors.neonBlue);
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonThemeData(
      Color color) {
    return FloatingActionButtonThemeData(
      backgroundColor: color,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData(Color color) {
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

  static TextStyle _textStyle(Color color, double textSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: textSize,
    );
  }
}
