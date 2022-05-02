import 'package:dio/dio.dart';
import 'package:films_app_trainee_task/data/mappers/mappers_to_domain_model.dart';
import 'package:films_app_trainee_task/data/mappers/mappers_to_network_model.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';

class MoviesRepositoryPutsReqImpl implements MoviesRepository {
  @override
  Future<List<Movie>> getMoviesList(
      {MoviesSearchParams? movieSearchParams}) async {
    final Dio client = Dio();
    try {
      const url = 'https://putsreq.com/YmKTwy7AttGkXev2Br2v';
      final response = await client.get(url);

      String jsonDataString = response.data.toString();
      final movieList = mapPutsReqJsonToMovieNetworkModelList(jsonDataString);
      return mapMovieNetworkModelListToMovieList(movieList);
    } catch (e) {
      throw e;
    }
  }

  @override
  void saveMovieListToLocalCash(List<Movie> movieList) {}
}
