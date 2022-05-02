import 'dart:convert';
import 'package:films_app_trainee_task/data/models/movie_network_model.dart';

List<MovieNetworkModel> mapPutsReqJsonToMovieNetworkModelList(
    String jsonDataString) {
  final jsonData = jsonDecode(jsonDataString);

  return jsonData['results'].map<MovieNetworkModel>(
    (json) {
      return MovieNetworkModel(
        id: json['id'].toString(),
        title: json['title'].toString(),
        releaseDate: json['release_date'].toString(),
        synopsys: json['overview'].toString(),
        usersFeedback: json['vote_average'].toString(),
        poster: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
      );
    },
  ).toList();
}

// method for theMovieDB
// List<MovieNetworkModel> _mapJsonToMovieNetworkModelList(
//     Response<dynamic> response) {
//   return response.data['results'].map<MovieNetworkModel>(
//     (json) {
//       return MovieNetworkModel(
//         id: json['title'].toString(),
//         title: json['title'].toString(),
//         releaseDate: json['release_date'].toString(),
//         synopsys: json['overview'].toString(),
//         usersFeedback: json['vote_average'].toString(),
//         poster: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
//       );
//     },
//   ).toList();
// }
