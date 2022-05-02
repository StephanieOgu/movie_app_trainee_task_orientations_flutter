import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';

class MoviesRepositoryController {
  late MoviesRepository _moviesRepository;

  void setRepository(MoviesRepository repository) {
    _moviesRepository = repository;
  }

  Future<List<Movie>> getMoviesList(
      {MoviesSearchParams? movieSearchParams}) async {
    return await _moviesRepository.getMoviesList(
        movieSearchParams: movieSearchParams);
  }

  void cashMoviesList(List<Movie> movieList){
    _moviesRepository.saveMovieListToLocalCash(movieList);
  }
}

