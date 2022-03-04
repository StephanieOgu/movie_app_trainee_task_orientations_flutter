import 'package:films_app_trainee_task/presentation/features/home/home_screen.dart';
import 'package:films_app_trainee_task/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/movies_repository.dart';

void main() {
  setUp();
  runApp(const MoviesApp());
}

void setUp() {
  GetIt.I.registerSingleton<MoviesRepository>(MoviesRepository());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MoviesAppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
