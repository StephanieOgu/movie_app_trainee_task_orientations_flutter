import 'package:flutter/material.dart';

//ignore: avoid_classes_with_only_static_members
class MoviesAppLocalizations {
  static MoviesAppLocalizations? of(BuildContext context) {
    return Localizations.of<MoviesAppLocalizations>(
      context,
      MoviesAppLocalizations,
    );
  }

  static String get entranceScreenName => 'entranceScreen';
  static String get moviesListCubitScreenName => 'moviesListCubitScreen';
  static String get movieDetailsCubitScreenName => 'movieDetailsCubitScreen';


  static String get entranceScreenLabel => 'Hi, Welcome to \n MovieApp!';
  static String get entranceScreenText => 'Choose your architecture pattern:)';
  static String get entranceScreenBlocBtnText => 'Bloc architecture';
  static String get entranceScreenMVVMBtnText => 'MVVM architecture!';

  static String get filmListScreenTitle => 'Popular movies';
  static String get errorTitle => 'Sorry, something went wrong :(';
  static String get filmListScreenHintText => 'Search movie..';
  static String get noResults => 'No such results';
  static String get filmDetailsRatingLabel => 'Rating:';

  static String get filmDetailsScreenOverviewTitle => 'Synopsis';
  static String get filmDetailsScreenCastTitle => 'Cast';
  static String get seeMoreBtnText => 'See more';
}

class MovieAppLocalizationsDelegate
    extends LocalizationsDelegate<MoviesAppLocalizations> {
  @override
  Future<MoviesAppLocalizations> load(Locale locale) =>
      Future(() => MoviesAppLocalizations());

  @override
  bool shouldReload(MovieAppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');
}
