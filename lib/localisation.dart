import 'dart:async';
import 'package:flutter/material.dart';

class MovieAppLocalizations {

  static MovieAppLocalizations? of(BuildContext context) {
    return Localizations.of<MovieAppLocalizations>(
      context,
      MovieAppLocalizations,
    );
  }
  static String get mainScreenText => 'Choose your architecture pattern:)';
  static String get mainScreenBlocBtnText => 'Bloc architecture';
  static String get mainScreenMVVMBtnText => 'MVVM architecture';

  static String get filmListScreenTitle => 'See Your Favourite Movie';
  static String get errorTitle => 'Sorry, something went wrong :(';
  static String get filmListScreenHintText => 'Search movie..';
  static String get noResults => 'No such results';

  static String get filmDetailsScreenTitle => 'About Movie';
  static String get filmDetailsScreenOverviewTitle => 'Synopsis';
  static String get filmDetailsScreenCastTitle => 'Cast';
  static String get filmDetailsScreenCrewTitle => 'Crew';

  static String get seeMoreBtnText => 'See more';
}

class MovieAppLocalizationsDelegate
    extends LocalizationsDelegate<MovieAppLocalizations> {
  @override
  Future<MovieAppLocalizations> load(Locale locale) =>
      Future(() => MovieAppLocalizations());

  @override
  bool shouldReload(MovieAppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');
}