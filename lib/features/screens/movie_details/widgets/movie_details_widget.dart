import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/widgets/template_elements/elements/movie_list_item/rating_bar.dart';
import 'package:films_app_trainee_task/features/theme/colors.dart';
import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';

const _movieBcPosterHeight = 80.0;

const _bcContainerMarginPortrait = 70.0;
const _bcContainerMarginLandscape = 30.0;

const _moviePosterHeight = 200.0;

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    Key? key,
    this.movie,
  }) : super(key: key);

  final Movie? movie;

  double _getContentContainerHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        _movieBcPosterHeight -
        _bcContainerMarginPortrait;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (builder, orientation) {
        return SingleChildScrollView(
          child: movie == null
              ? Container()
              : Stack(
                  children: [
                    _buildBcMoviePoster(),
                    _buildContent(
                      context: context,
                      orientation: orientation,
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildBcMoviePoster() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(movie!.poster),
        fit: BoxFit.fitWidth,
        // width: double.infinity,
      ),
    );
  }

  Widget _buildContent({
    required BuildContext context,
    required Orientation orientation,
  }) {
    return Container(
      margin: const EdgeInsets.only(
        top: _movieBcPosterHeight,
      ),
      child: Stack(
        children: [
          _buildBcContainer(orientation),
          _buildMovieInfo(
            context: context,
            orientation: orientation,
          ),
        ],
      ),
    );
  }

  Widget _buildBcContainer(Orientation orientation) {
    final margin = orientation == Orientation.portrait
        ? _bcContainerMarginPortrait
        : _bcContainerMarginLandscape;
    return Positioned.fill(
      child: Container(
        margin: EdgeInsets.only(top: margin),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo({
    required BuildContext context,
    required Orientation orientation,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMoviePoster(),
              _buildMovieTitle(
                context: context,
                orientation: orientation,
              ),
            ],
          ),
          _buildMovieRating(context),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
            child: Text(
              MoviesAppLocalizations.filmDetailsScreenOverviewTitle,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoviePoster() {
    final double height = _moviePosterHeight;
    return Expanded(
      child: SizedBox(
        height: height,
        width: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            movie!.poster,
          ),
        ),
      ),
    );
  }

  Widget _buildMovieTitle({
    required BuildContext context,
    required Orientation orientation,
  }) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
        ),
        child: Text(
          movie!.title,
          style: orientation == Orientation.portrait
              ? Theme.of(context).textTheme.headline3
              : Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Padding _buildMovieRating(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints:
            BoxConstraints(minHeight: _getContentContainerHeight(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingInfo(context),
          ],
        ),
      ),
    );
  }

  Row _buildRatingInfo(BuildContext context) {
    return Row(
      children: [
        Text(
          MoviesAppLocalizations.filmDetailsRatingLabel,
          style: Theme.of(context).textTheme.headline4,
        ),
        RatingBarWidget(
          rating: double.parse(movie!.usersFeedback)/2,
          color: AppColors.supernova,
        ),
        Text(
          '(${movie!.usersFeedback})',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
