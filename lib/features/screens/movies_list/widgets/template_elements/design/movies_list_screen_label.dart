import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';

class MoviesListScreenLabel extends StatelessWidget {
  MoviesListScreenLabel({Key? key}) : super(key: key);

  final String text = MoviesAppLocalizations.filmListScreenTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 0, 12),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.start,
      ),
    );
  }
}
