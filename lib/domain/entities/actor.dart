import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Actor extends Equatable {
  const Actor({
    required this.id,
    required this.name,
    required this.character,
    required this.urlImage,
  });

  final String id;
  final String name;
  final String character;
  final String urlImage;

  @override
  List<Object> get props => [
        id,
        name,
        character,
        urlImage,
      ];
}
