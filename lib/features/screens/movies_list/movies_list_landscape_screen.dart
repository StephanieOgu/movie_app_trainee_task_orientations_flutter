import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movie_details/widgets/movie_details_widget.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/movies_list_widget.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/design/app_bar_image_bc.dart';

import 'package:flutter/material.dart';

class MoviesListLandscapeScreen extends StatelessWidget {
  const MoviesListLandscapeScreen({
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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarImageBcImage(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: MoviesListWidget(
            movies: movies,
            selectedMovie: selectedMovie,
            onMovieSelected: onMovieSelected,
          ),
        ),
        Expanded(
          flex: 3,
          child: MovieDetailsWidget(
            movie: selectedMovie,
          ),
        )
      ],
    );
  }
}
