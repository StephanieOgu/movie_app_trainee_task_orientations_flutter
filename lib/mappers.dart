import 'package:films_app_trainee_task/presentation/entities/movie_ui_entity.dart';
import 'data/entities/movie_data_entity.dart';

MovieUIEntity mapFilmUIEntityToDataEntity(MovieDataEntity movieDataEntity) {
  return MovieUIEntity(
    id: movieDataEntity.id,
    title: movieDataEntity.title,
    releaseDate: movieDataEntity.releaseDate,
    usersFeedback: movieDataEntity.usersFeedback,
    synopsys: movieDataEntity.synopsys,
    poster: movieDataEntity.poster,
  );
}

List<MovieUIEntity> mapFilmUIEntityListToDataEntityList(
    List<MovieDataEntity> movieDataEntityList) {
  return movieDataEntityList.map(mapFilmUIEntityToDataEntity).toList();
}
