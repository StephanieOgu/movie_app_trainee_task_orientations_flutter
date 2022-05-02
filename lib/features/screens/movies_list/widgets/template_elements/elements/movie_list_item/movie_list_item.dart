import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/movie_poster_configure.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/elements/movie_list_item/rating_bar.dart';
import 'package:films_app_trainee_task/features/theme/colors.dart';

import 'package:flutter/material.dart';

class MovieListItemWidget extends StatelessWidget {
  const MovieListItemWidget({
    Key? key,
    required this.movie,
    required this.selectedMovieId,
    required this.configure,
    required this.onTap,
  }) : super(key: key);

  final Movie movie;
  final String? selectedMovieId;
  final MoviePosterConfigure configure;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color movieItemColor =
        selectedMovieId != null && movie.id == selectedMovieId!
            ? AppColors.hintOfRed
            : AppColors.white;

    final Color ratingColor =
        selectedMovieId != null && movie.id == selectedMovieId!
            ? AppColors.supernova
            : AppColors.cherokee;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _buildBcContainer(movieItemColor),
          _buildMovieItemInfoElements(
            movieItemColor: movieItemColor,
            ratingColor: ratingColor,
            context: context,
          ),
        ],
      ),
    );
  }

  Positioned _buildBcContainer(Color movieItemColor) {
    return Positioned.fill(
      child: Container(
        padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
        decoration: BoxDecoration(
          color: movieItemColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Row _buildMovieItemInfoElements({
    required Color movieItemColor,
    required Color ratingColor,
    required BuildContext context,
  }) {
    return Row(
      children: <Widget>[
        _buildMoviePoster(),
        Expanded(
          child: _buildMovieTextInfo(
            movieItemColor: movieItemColor,
            ratingColor: ratingColor,
            context: context,
          ),
        ),
      ],
    );
  }

  Widget _buildMoviePoster() {
    return Container(
      height: configure.posterHeight,
      width: configure.posterWidth,
      margin: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 15.0),
      child: ClipRRect(
        borderRadius: configure.movePosterBorderRadius,
        child: Image.network(
          movie.poster,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMovieTextInfo({
    required Color movieItemColor,
    required Color ratingColor,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTextLabel(
            movie.title,
            movie.id == selectedMovieId
                ? Theme.of(context).textTheme.headline3
                : Theme.of(context).textTheme.headline2,
          ),
          RatingBarWidget(
            rating: double.parse(movie.usersFeedback)/2,
            color: ratingColor,
          ),
          _buildTextLabel(
            'Release: ${movie.releaseDate}',
            Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Widget _buildTextLabel(String text, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
