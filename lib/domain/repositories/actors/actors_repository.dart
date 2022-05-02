import 'package:films_app_trainee_task/domain/entities/actor.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';

abstract class ActorsRepository {
  Future<List<Actor>> getActorsListByMovie(Movie movie);
}
