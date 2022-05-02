import 'package:flutter/material.dart';

@immutable
class MoviePosterConfigure {
  const MoviePosterConfigure({
    required this.posterHeight,
    required this.posterWidth,
    required this.movePosterBorderRadius,
  });

  final double posterHeight;
  final double posterWidth;
  final BorderRadius movePosterBorderRadius;
}
