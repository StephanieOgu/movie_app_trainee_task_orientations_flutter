import 'package:films_app_trainee_task/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../keys.dart';
import '../../entities/movie_ui_entity.dart';
import '../movie_details/movie_details_widget.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({Key? key, required this.movies}) : super(key: key);
  final List<MovieUIEntity> movies;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Container(
        color: AppColors.white,
        child: _buildContent(orientation),
      );
    });
  }

  Widget _buildContent(Orientation orientation) {
    MovieListScreenConfigure movieListScreenConfigure;
    if (orientation == Orientation.portrait) {
      movieListScreenConfigure = MovieListScreenConfigure(
        movieDetailsFlex: 2,
        posterHeight: 200.0,
        borderRadius: BorderRadius.circular(30.0),
        openMovieDetails: openDetailsScreen,
      );
    } else {
      movieListScreenConfigure = MovieListScreenConfigure(
        movieDetailsFlex: 8,
        posterHeight: 100.0,
        borderRadius: BorderRadius.circular(10.0),
        openMovieDetails: openDetailsScreen,
      );
    }
    return _buildMovieList(movieListScreenConfigure);
  }

  Widget _buildMovieList(MovieListScreenConfigure configure) {
    return ListView.builder(
      key: moviesListKey,
      itemCount: movies.length,
      itemBuilder: (context, index) => _buildMoviesListItem(
        index: index,
        context: context,
        configure: configure,
      ),
    );
  }

  Widget _buildMoviesListItem({
    required int index,
    required BuildContext context,
    required MovieListScreenConfigure configure,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMoviePoster(
                movie: movies[index],
                configure: configure,
              ),
              _buildMovieInfo(
                movie: movies[index],
                context: context,
                flex: configure.movieDetailsFlex,
              ),
            ],
          ),
        ),
        onTap: () {
          configure.openMovieDetails(context: context, movie: movies[index]);
        },
      ),
    );
  }

  Widget _buildMoviePoster({
    required MovieUIEntity movie,
    required MovieListScreenConfigure configure,
  }) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 4, right: 4),
          child: ClipRRect(
            borderRadius: configure.borderRadius,
            child: Image.network(
              movie.poster,
              height: configure.posterHeight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo({
    required MovieUIEntity movie,
    required BuildContext context,
    required int flex,
  }) {
    return Expanded(
      flex: flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMovieInfoElement(
            title: movie.title,
            context: context,
            textStyle: Theme.of(context).textTheme.headline2,
          ),
          _buildRatingBar(double.parse(movie.usersFeedback) / 10),
          _buildMovieInfoElement(
            title: movie.releaseDate,
            context: context,
            textStyle: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Widget _buildMovieInfoElement({
    required String title,
    required BuildContext context,
    required TextStyle? textStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        bottom: 2.0,
      ),
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }

  Widget _buildRatingBar(double rating) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 0,
        maxRating: 10,
        itemCount: 5,
        itemSize: 20,
        allowHalfRating: true,
        direction: Axis.horizontal,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.local_movies,
          color: AppColors.supernova,
        ),
        onRatingUpdate: (rating) {},
      ),
    );
  }

  void openDetailsScreen(
      {required BuildContext context, required MovieUIEntity movie}) async {
    //TODO: Edit this function
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilmDetailsScreen(movie: movie),
      ),
    );
  }
}

class MovieListScreenConfigure {
  const MovieListScreenConfigure({
    required this.movieDetailsFlex,
    required this.posterHeight,
    required this.borderRadius,
    required this.openMovieDetails,
  });

  final double posterHeight;
  final int movieDetailsFlex;
  final BorderRadius borderRadius;
  final Function({required BuildContext context, required MovieUIEntity movie})
      openMovieDetails;
}
