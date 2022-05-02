import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';

import 'package:sqflite/sqflite.dart' as sql;

const String tableMovies = 'moviesList';
const String columnId = '_id';
const String movieId = 'movieId';
const String movieTitle = 'title';
const String movieReleaseDate = 'releaseDate';
const String movieUsersFeedback = 'usersFeedback';
const String movieSynopsys = 'synopsys';
const String moviePoster = 'poster';

class MoviesRepositorySqfLiteImpl implements MoviesRepository {
  @override
  Future<List<Movie>> getMoviesList({
    MoviesSearchParams? movieSearchParams,
  }) async {
    final db = await _db();
    final queryResults = await db.query(tableMovies);
    final mappedResults = _mapResultsToMapList(queryResults);
    List<Movie> movies = [];
    mappedResults.forEach((element) {
      movies.add(_mapJsonToMovie(element));
    });
    return movies;
  }

  static Future<sql.Database> _db() async {
    return sql.openDatabase(
      tableMovies,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await _createTable(database);
      },
    );
  }

  static Future<void> _createTable(sql.Database database) async {
    database.execute(''' create table $tableMovies (
          $columnId integer primary key autoincrement,
          $movieId text not null,
          $movieTitle text not null,
          $movieReleaseDate text not null,
          $movieUsersFeedback text not null,
          $movieSynopsys text not null,
          $moviePoster text not null)   
          ''');
  }

  List<Map<String, dynamic>> _mapResultsToMapList(
      List<Map<String, dynamic>> results) {
    return List<Map<String, dynamic>>.generate(
      results.length,
      (index) => Map<String, dynamic>.from(results[index]),
      growable: true,
    );
  }

  Movie _mapJsonToMovie(Map<String, dynamic> json) {
    return Movie(
      id: json[movieId].toString(),
      title: json[movieTitle].toString(),
      releaseDate: json[movieReleaseDate].toString(),
      synopsys: json[movieSynopsys].toString(),
      usersFeedback: json[movieUsersFeedback].toString(),
      poster: json[moviePoster].toString(),
    );
  }

  @override
  void saveMovieListToLocalCash(List<Movie> movieList) async {
    final oldMovieList = await getMoviesList();
    try {
      _clearDB();
      _addMovieListToDB(movieList);
    } catch (ex) {
      _addMovieListToDB(oldMovieList);
    }
  }

  Future<void> _clearDB() async {
    final db = await _db();
    await db.rawQuery("delete from " + tableMovies);
  }

  void _addMovieListToDB(List<Movie> movieList) {
    for (int i = 0; i < movieList.length; ++i) {
      _addMovieToDB(movie: movieList[i], index: i);
    }
  }

  void _addMovieToDB({
    required Movie movie,
    required int index,
  }) async {
    final db = await _db();
    final data = {
      columnId: index,
      movieId: movie.id,
      movieTitle: movie.title,
      movieReleaseDate: movie.releaseDate,
      movieUsersFeedback: movie.usersFeedback,
      movieSynopsys: movie.synopsys,
      moviePoster: movie.poster,
    };
    await db.insert(
      tableMovies,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
