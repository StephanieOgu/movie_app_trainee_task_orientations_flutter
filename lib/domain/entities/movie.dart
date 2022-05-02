import 'package:equatable/equatable.dart';
import 'package:films_app_trainee_task/domain/entities/actor.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Movie extends Equatable {
  const Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.usersFeedback,
    required this.poster,
    required this.synopsys,
    this.actors,
  });

  final String id;
  final String title;
  final String releaseDate;
  final String usersFeedback;
  final String synopsys;
  final String poster;
  final List<Actor>? actors;

  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        usersFeedback,
        poster,
        synopsys,
        actors,
      ];
}
