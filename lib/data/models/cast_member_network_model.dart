import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CastMemberNetworkModel extends Equatable {
  const CastMemberNetworkModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.character,
    required this.urlImage,
    required this.position,
  });

  final String id;
  final String name;
  final String gender;
  final String character;
  final String urlImage;
  final String position;

  @override
  List<Object?> get props => [
        id,
        name,
        gender,
        character,
        urlImage,
        position,
      ];
}
