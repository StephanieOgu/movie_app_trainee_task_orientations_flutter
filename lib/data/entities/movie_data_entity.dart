import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class MovieDataEntity extends Equatable {
  const MovieDataEntity({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.usersFeedback,
    required this.poster,
    required this.synopsys,
  });

  final String id;
  final String title;
  final String releaseDate;
  final String usersFeedback;
  final String synopsys;
  final String poster;

  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        usersFeedback,
        poster,
        synopsys,
      ];
}
