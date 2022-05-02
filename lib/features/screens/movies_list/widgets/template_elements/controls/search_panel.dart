import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';

class SearchPanelWidget extends StatelessWidget {
  const SearchPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: MoviesAppLocalizations.filmListScreenHintText,
        icon: const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Icon(Icons.search),
        ),
        hintStyle: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
