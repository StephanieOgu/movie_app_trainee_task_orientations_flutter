import 'package:films_app_trainee_task/data/repositories/movies/movies_repository_puts_req_impl.dart';
import 'package:films_app_trainee_task/data/repositories/movies/movies_repository_sqflite_impl.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/bloc/movies_list_cubit.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/movie_poster_configure.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/controls/search_panel.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/design/movies_list_screen_label.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/elements/movie_list_item/movie_list_item.dart';
import 'package:films_app_trainee_task/features/theme/colors.dart';
import 'package:films_app_trainee_task/keys.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
    Key? key,
    required this.movies,
    required this.onMovieSelected,
    this.selectedMovie,
  }) : super(key: key);

  //todo: read about factory, injections

  final List<Movie> movies;
  final Function(Movie, BuildContext) onMovieSelected;
  final Movie? selectedMovie;

  MoviePosterConfigure _getScreenConfigure(Orientation orientation) {
    return orientation == Orientation.portrait
        ? MoviePosterConfigure(
            posterHeight: 150.0,
            posterWidth: 100.0,
            movePosterBorderRadius: BorderRadius.circular(20.0),
          )
        : MoviePosterConfigure(
            posterHeight: 100.0,
            posterWidth: 60.0,
            movePosterBorderRadius: BorderRadius.circular(10.0),
          );
  }

  @override
  Widget build(BuildContext context) {
    _cashMoviesList(context);
    return OrientationBuilder(
      builder: (builder, orientation) {
        return Container(
          color: AppColors.lightAliceBlue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchPanelWidget(),
              MoviesListScreenLabel(),
              _buildMovieList(
                _getScreenConfigure(orientation),
                context,
              ),
            ],
          ),
        );
      },
    );
  }

  void _cashMoviesList(BuildContext context) async {
    final cubit = await context.read<MoviesListCubit>();
    cubit.setRepository(MoviesRepositorySqfLiteImpl());
    cubit.cashMoviesList(movies);
  }

  Widget _buildMovieList(
    MoviePosterConfigure configure,
    BuildContext context,
  ) {
    return Expanded(
      child: RefreshIndicator(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          key: AppKeys.moviesListKey,
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieListItemWidget(
            onTap: () => onMovieSelected(
              movies[index],
              context,
            ),
            movie: movies[index],
            configure: configure,
            selectedMovieId: selectedMovie?.id,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
        ),
        onRefresh: () async {
          _refresh(context);
        },
      ),
    );
  }

  void _refresh(BuildContext context) async {
    final cubit = await context.read<MoviesListCubit>();
    cubit.setRepository(MoviesRepositoryPutsReqImpl());
    cubit.loadMovies();
  }
}
