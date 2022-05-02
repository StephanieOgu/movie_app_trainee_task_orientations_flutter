import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';

class EntranceScreenHeadlineWidget extends StatelessWidget {
  const EntranceScreenHeadlineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 20,
      child: Text(
        MoviesAppLocalizations.entranceScreenLabel,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class EntranceScreenCaptionWidget extends StatelessWidget {
  const EntranceScreenCaptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          MoviesAppLocalizations.entranceScreenText,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
