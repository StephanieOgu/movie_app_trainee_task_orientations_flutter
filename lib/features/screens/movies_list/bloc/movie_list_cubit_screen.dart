import 'package:films_app_trainee_task/data/repositories/movies/movies_repository_sqflite_impl.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository_controller.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/bloc/movies_list_cubit.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/movies_list_landscape_screen.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/movies_list_portrait_screen.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/elements/error_screen_widget.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/elements/loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListCubitScreen extends StatelessWidget {
  const MoviesListCubitScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviesRepositoryController moviesRepositoryController =
        _createMovieRepositoryController();

    return BlocProvider<MoviesListCubit>(
      create: (context) =>
          MoviesListCubit(repositoryController: moviesRepositoryController),
      child: BlocBuilder<MoviesListCubit, MoviesListState>(
        builder: (context, state) {
          if (state is MoviesListLoadingState) {
            return const LoadingWidget();
          } else if (state is MoviesListErrorState) {
            return ErrorScreenWidget(errorText: state.loadingError);
          } else if (state is MoviesListLoadedState) {
            return OrientationBuilder(
              builder: (builder, orientation) {
                return orientation == Orientation.portrait
                    ? MoviesListPortraitScreen(
                        movies: state.movieList,
                        selectedMovie: state.selectedMovie,
                        onMovieSelected: _selectMoviePortraitMode,
                      )
                    : MoviesListLandscapeScreen(
                        movies: state.movieList,
                        selectedMovie: state.selectedMovie,
                        onMovieSelected: _selectMovieLandscapeMode,
                      );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  MoviesRepositoryController _createMovieRepositoryController() {
    final moviesRepositoryController = MoviesRepositoryController();
    moviesRepositoryController.setRepository(
      MoviesRepositorySqfLiteImpl(),
    );
    return moviesRepositoryController;
  }

  void _selectMoviePortraitMode(
    Movie selectedMovie,
    BuildContext context,
  ) {
    _selectMovieByBlocArchitecture(context, selectedMovie);
  }

  void _selectMovieLandscapeMode(
    Movie selectedMovie,
    BuildContext context,
  ) {
    _selectMovieByBlocArchitecture(context, selectedMovie);
  }

  void _selectMovieByBlocArchitecture(
    BuildContext context,
    Movie selectedMovie,
  ) {
    context.read<MoviesListCubit>().selectMovie(selectedMovie);
  }
}
