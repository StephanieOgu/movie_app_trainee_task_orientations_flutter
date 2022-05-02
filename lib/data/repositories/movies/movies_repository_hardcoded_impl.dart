import 'package:films_app_trainee_task/data/mappers/mappers_to_domain_model.dart';
import 'package:films_app_trainee_task/data/models/movie_network_model.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';

class MoviesRepositoryHardcodedImpl implements MoviesRepository {
  @override
  Future<List<Movie>> getMoviesList(
      {MoviesSearchParams? movieSearchParams}) async {
    final movieList = await <MovieNetworkModel>[
      const MovieNetworkModel(
        id: '1',
        title: 'Dorian Gray',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster: 'https://s2.vcdn.biz/static/f/424747361/image.jpg',
      ),
      const MovieNetworkModel(
        id: '2',
        title: 'In time',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster:
            'https://www.hdclub.ua/files/film_poster/big/bigi4f23f623e496f.jpg',
      ),
      const MovieNetworkModel(
        id: '3',
        title: 'Kimi',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '39',
        poster: 'https://image.kinokrad.co/p/f/1645036839_kimi.jpeg',
      ),
      const MovieNetworkModel(
        id: '4',
        title: 'Luca',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '1',
        poster:
            'https://lumiere-a.akamaihd.net/v1/images/image_2ff75a5c.jpeg?region=0%2C0%2C540%2C810',
      ),
      const MovieNetworkModel(
        id: '5',
        title: 'Caroline',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '100',
        poster:
            'http://pm1.narvii.com/6982/1fc37a6690ae642902a7d2ea0cbdbcb6d6b4ee04r1-1012-1500v2_uhq.jpg',
      ),
      const MovieNetworkModel(
        id: '6',
        title: 'Attack on Titan',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '50',
        poster: 'https://fwcdn.pl/fpo/62/27/636227/7548140.3.jpg',
      ),
      const MovieNetworkModel(
        id: '7',
        title: 'Ralph breaks the internet',
        releaseDate: '10-08-2020',
        usersFeedback: '50',
        poster: 'https://lumiere-a.akamaihd.net/v1/images/image_94f89ec1.jpeg',
        synopsys: 'synopsys',
      ),
      const MovieNetworkModel(
        id: '8',
        title: 'The 40 Year-old Virgin',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster:
            'https://static.boredpanda.com/blog/wp-content/uploads/2016/06/2005-forty_year_old_virgin-1-574ff24fc22ec__700.jpg',
      ),
    ];
    return mapMovieNetworkModelListToMovieList(movieList);
  }

  @override
  void saveMovieListToLocalCash(List<Movie> movieList) {}
}
