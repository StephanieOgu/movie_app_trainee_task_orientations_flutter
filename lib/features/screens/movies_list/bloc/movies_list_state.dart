part of 'package:films_app_trainee_task/features/screens/movies_list/bloc/movies_list_cubit.dart';

abstract class MoviesListState extends Equatable {
  MoviesListState({
    required this.selectedMovie,
    required this.movieList,
  });

  final Movie? selectedMovie;
  final List<Movie> movieList;
}

class MoviesListInitialState extends MoviesListState {
  MoviesListInitialState()
      : super(
          selectedMovie: null,
          movieList: List.empty(),
        );

  @override
  List<Object?> get props => [
        selectedMovie,
        movieList,
      ];
}

class MoviesListErrorState extends MoviesListState {
  MoviesListErrorState({
    required this.loadingError,
    required Movie? selectedMovie,
  }) : super(
          selectedMovie: selectedMovie,
          movieList: List.empty(),
        );

  final String loadingError;

  @override
  List<Object?> get props => [
        this.loadingError,
        selectedMovie,
        movieList,
      ];
}

class MoviesListLoadingState extends MoviesListState {
  MoviesListLoadingState({
    required Movie? selectedMovie,
  }) : super(
          selectedMovie: selectedMovie,
          movieList: List.empty(),
        );

  @override
  List<Object?> get props => [
        selectedMovie,
        movieList,
      ];
}

class MoviesListLoadedState extends MoviesListState {
  MoviesListLoadedState({
    required this.movieList,
    Movie? selectedMovie,
    this.searchParams,
  }) : super(
          selectedMovie: selectedMovie,
          movieList: movieList,
        );

  final List<Movie> movieList;
  final MoviesSearchParams? searchParams;

  @override
  List<Object?> get props => [
        this.movieList,
        selectedMovie,
        searchParams,
      ];
}
