import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/bloc/movies_list_cubit.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/details_screen_pop_result.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/movies_list_widget.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/design/app_bar_image_bc.dart';
import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListPortraitScreen extends StatelessWidget {
  const MoviesListPortraitScreen({
    Key? key,
    required this.movies,
    required this.onMovieSelected,
    this.selectedMovie,
  }) : super(key: key);

  final List<Movie> movies;
  final Function(Movie, BuildContext) onMovieSelected;
  final Movie? selectedMovie;

  @override
  Widget build(BuildContext context) {
    if (selectedMovie != null) {
      WidgetsBinding.instance!.addPostFrameCallback(
        (_) {
          openDetailsScreen(context).then(
            (detailsScreenPopResult) {
              switch (detailsScreenPopResult) {
                case DetailsScreenPopResult.changeOrientation:
                  break;
                case DetailsScreenPopResult.unselectMovie:
                  _unselectMovieByBlocArchitecture(context);
                  break;
                default:
                  break;
              }
            },
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarImageBcImage(),
      ),
      body: MoviesListWidget(
        movies: movies,
        selectedMovie: selectedMovie,
        onMovieSelected: onMovieSelected,
      ),
    );
  }

  void _unselectMovieByBlocArchitecture(BuildContext context) {
    context.read<MoviesListCubit>().unselectMovie();
  }

  Future<DetailsScreenPopResult?> openDetailsScreen(
    BuildContext context,
  ) async {
    return Navigator.pushNamed<DetailsScreenPopResult>(
      context,
      MoviesAppLocalizations.movieDetailsCubitScreenName,
      arguments: {
        selectedMovie,
      },
    );
  }
}
