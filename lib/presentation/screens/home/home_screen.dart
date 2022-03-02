import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {},
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                'text',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'text',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
