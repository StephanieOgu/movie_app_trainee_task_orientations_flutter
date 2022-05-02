import 'package:films_app_trainee_task/data/mappers/mappers_to_domain_model.dart';
import 'package:films_app_trainee_task/data/models/cast_member_network_model.dart';
import 'package:films_app_trainee_task/domain/entities/actor.dart';
import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/domain/repositories/actors/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  @override
  Future<List<Actor>> getActorsListByMovie(Movie movie) async {
    List<CastMemberNetworkModel> staffList = await _getAllMovieStaffList('1');
    final actorsList =
        staffList.where((element) => element.position == 'Acting').toList();
    return mapMovieCastMemberNetworkModelListToActorList(actorsList);
  }

  Future<List<CastMemberNetworkModel>> _getAllMovieStaffList(
      String MovieId) async {
    try {
      final actorsList = await <CastMemberNetworkModel>[
        const CastMemberNetworkModel(
          id: '1',
          name: 'Derek',
          gender: '1',
          character: 'character',
          urlImage: 'urlImage',
          position: 'position',
        ),
        const CastMemberNetworkModel(
          id: '2',
          name: 'Anna',
          gender: '1',
          character: 'character',
          urlImage: 'urlImage',
          position: 'position',
        ),
        const CastMemberNetworkModel(
          id: '3',
          name: 'Lisa',
          gender: '3',
          character: 'character',
          urlImage: 'urlImage',
          position: 'position',
        ),
      ];
      return actorsList;
    } catch (e) {
      return List.empty();
    }
  }
}
