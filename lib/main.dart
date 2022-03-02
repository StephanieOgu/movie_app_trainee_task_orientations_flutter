import 'package:films_app_trainee_task/presentation/screens/home/home_screen.dart';
import 'package:films_app_trainee_task/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FilmsApp());
}

class FilmsApp extends StatelessWidget {
  const FilmsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FilmsAppTheme.lightTheme,
      home:  const HomeScreen(),
    );
  }
}