import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMoviesList({MoviesSearchParams? movieSearchParams});
  void saveMovieListToLocalCash(List<Movie> movieList);
}
//todo: abstraction in data