import '../entities/movie_data_entity.dart';

class MoviesRepository {
  Future<List<MovieDataEntity>> getFilmsList() async {
    return <MovieDataEntity>[
      const MovieDataEntity(
        id: '1',
        title: 'Dorian Grey',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster: 'https://s2.vcdn.biz/static/f/424747361/image.jpg',
      ),
      const MovieDataEntity(
        id: '2',
        title: 'In time',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster:
            'https://www.hdclub.ua/files/film_poster/big/bigi4f23f623e496f.jpg',
      ),
      const MovieDataEntity(
        id: '3',
        title: 'Kimi',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '39',
        poster: 'https://image.kinokrad.co/p/f/1645036839_kimi.jpeg',
      ),
      const MovieDataEntity(
        id: '4',
        title: 'Luca',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '1',
        poster:
            'https://lumiere-a.akamaihd.net/v1/images/image_2ff75a5c.jpeg?region=0%2C0%2C540%2C810',
      ),
      const MovieDataEntity(
        id: '5',
        title: 'Caroline',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '100',
        poster:
            'http://pm1.narvii.com/6982/1fc37a6690ae642902a7d2ea0cbdbcb6d6b4ee04r1-1012-1500v2_uhq.jpg',
      ),
      const MovieDataEntity(
        id: '6',
        title: 'Attack on Titan',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '50',
        poster: 'https://fwcdn.pl/fpo/62/27/636227/7548140.3.jpg',
      ),
      const MovieDataEntity(
        id: '7',
        title: 'Hello',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster: 'https://s2.vcdn.biz/static/f/424747361/image.jpg',
      ),
      const MovieDataEntity(
        id: '8',
        title: 'The 40 Year-old Virgin',
        synopsys: 'Hello',
        releaseDate: '19-04-2008',
        usersFeedback: '88',
        poster:
            'https://static.boredpanda.com/blog/wp-content/uploads/2016/06/2005-forty_year_old_virgin-1-574ff24fc22ec__700.jpg',
      ),
    ];
  }
}
