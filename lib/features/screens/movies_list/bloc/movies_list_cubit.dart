import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/entities/movies_search_params.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository_controller.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/refresh_result.dart';

part 'package:films_app_trainee_task/features/screens/movies_list/bloc/movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit({required this.repositoryController})
      : super(
          MoviesListInitialState(),
        ) {
    loadMovies();
  }

  MoviesRepositoryController repositoryController;

  void setRepository(MoviesRepository repository) {
    repositoryController.setRepository(repository);
  }

  Future<RefreshedResult> loadMovies() async {
    _emitLoadingState();
    bool isSuccess = false;
    try {
      final movieList = await repositoryController.getMoviesList();
      _emitLoadedState(movieList);
      isSuccess = true;
    } catch (e) {
      _emitErrorState(e);
    }
    return isSuccess ? RefreshedResult.success : RefreshedResult.failed;
  }

  void _emitLoadingState() {
    emit(
      MoviesListLoadingState(
        selectedMovie: state.selectedMovie,
      ),
    );
  }

  void _emitLoadedState(List<Movie> movieList) {
    emit(
      MoviesListLoadedState(
        movieList: movieList,
        selectedMovie: state.selectedMovie,
      ),
    );
  }

  void _emitErrorState(Object e) {
    emit(MoviesListErrorState(
      loadingError: e.toString(),
      selectedMovie: state.selectedMovie,
    ));
  }

  void selectMovie(Movie movie) {
    emit(
      MoviesListLoadedState(
        movieList: state.movieList,
        selectedMovie: movie,
      ),
    );
  }

  void unselectMovie() {
    emit(
      MoviesListLoadedState(
        movieList: state.movieList,
        selectedMovie: null,
      ),
    );
  }

  void cashMoviesList(List<Movie> movieList){
    repositoryController.cashMoviesList(movieList);
  }
}

//1 - try local
//if they are - local, if no - pull to refresh
//pull to refresh - pull to refresh + store to local

// I store this for mvvm architecture
// late StreamController<List<Movie>> moviesListStreamController;
//_createMoviesListStream() {
//   moviesListStreamController = StreamController<List<Movie>>();
// }
//
// Future<RefreshedResult> _refreshMovies() async {
//   Stream moviesListStream = moviesListStreamController.stream;
//   _pullMoviesListStream(state);
//   bool isSuccess = false;
//   moviesListStream.listen(
//         (movieListFromStream) async {
//       try {
//         emit(
//           MoviesListLoadingState(
//             selectedMovie: state.selectedMovie,
//           ),
//         );
//         emit(
//           MoviesListLoadedState(
//             movieList: movieListFromStream,
//             selectedMovie: state.selectedMovie,
//           ),
//         );
//         isSuccess = true;
//       } catch (e) {
//         isSuccess = false;
//         loadMoviesList(
//           MoviesSearchParams(pageNumber: 1),
//         );
//       }
//     },
//   );
//   return isSuccess ? RefreshedResult.success : RefreshedResult.failed;
// }
//
// Future<void> _pullMoviesListStream(MoviesListState state) async {
//   final controller = moviesListStreamController;
//   final movieList = await moviesRepository.getMoviesListFromSource();
//   controller.add(movieList);
// }
// @override
//   Future<void> close() {
//     moviesListStreamController.close();
//     return super.close();
//   }
