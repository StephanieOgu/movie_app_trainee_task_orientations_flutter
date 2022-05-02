import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/entrance/entrance_screen.dart';
import 'package:films_app_trainee_task/features/screens/movie_details/movie_details_screen.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/bloc/movie_list_cubit_screen.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/details_screen_pop_result.dart';
import 'package:films_app_trainee_task/features/theme/theme.dart';
import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MoviesAppTheme.lightTheme,
      initialRoute: MoviesAppLocalizations.entranceScreenName,
      routes: {
        MoviesAppLocalizations.entranceScreenName: (context) =>
            const EntranceScreen(),
        MoviesAppLocalizations.moviesListCubitScreenName: (context) =>
            const MoviesListCubitScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name ==
            MoviesAppLocalizations.movieDetailsCubitScreenName) {
          if (settings.arguments != null) {
            final args = settings.arguments! as Set;
            final selectedMovie = args.first as Movie;
            return MaterialPageRoute<DetailsScreenPopResult>(
              settings: settings,
              builder: (context) =>
                  MovieDetailsScreen(selectedMovie: selectedMovie),
            );
          }
        }
        return null;
      },
    );
  }
}
