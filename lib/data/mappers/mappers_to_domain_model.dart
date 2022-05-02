import 'package:films_app_trainee_task/data/models/cast_member_network_model.dart';
import 'package:films_app_trainee_task/data/models/movie_network_model.dart';
import 'package:films_app_trainee_task/domain/entities/actor.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';

Movie mapMovieNetworkModelToMovie(MovieNetworkModel movieDataEntity) {
  return Movie(
    id: movieDataEntity.id,
    title: movieDataEntity.title,
    releaseDate: movieDataEntity.releaseDate,
    usersFeedback: movieDataEntity.usersFeedback,
    synopsys: movieDataEntity.synopsys,
    poster: movieDataEntity.poster,
  );
}

List<Movie> mapMovieNetworkModelListToMovieList(
  List<MovieNetworkModel> movieDataEntityList,
) {
  return movieDataEntityList.map(mapMovieNetworkModelToMovie).toList();
}

Actor mapNetworkModelToActor(
  CastMemberNetworkModel movieStaffMemberDataModel,
) {
  return Actor(
    id: movieStaffMemberDataModel.id,
    name: movieStaffMemberDataModel.name,
    character: movieStaffMemberDataModel.character,
    urlImage: movieStaffMemberDataModel.urlImage.contains('null') &&
            movieStaffMemberDataModel.gender == '1'
        ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
        : movieStaffMemberDataModel.urlImage.contains('null')
            ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
            : 'https://image.tmdb.org/t/p/w185${movieStaffMemberDataModel.urlImage}',
  );
}

List<Actor> mapMovieCastMemberNetworkModelListToActorList(
  List<CastMemberNetworkModel> actorsDataModelList,
) {
  return actorsDataModelList.map(mapNetworkModelToActor).toList();
}
