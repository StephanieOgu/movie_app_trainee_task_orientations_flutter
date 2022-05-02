import 'package:equatable/equatable.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';

class MovieListResponse extends Equatable{
  const MovieListResponse(this.movieList);

  final List<Movie>? movieList;

  @override
  List<Object?> get props => [movieList];
}