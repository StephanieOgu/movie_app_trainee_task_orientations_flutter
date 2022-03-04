import 'package:films_app_trainee_task/localisation.dart';
import 'package:films_app_trainee_task/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/repositories/movies_repository.dart';
import '../../../mappers.dart';
import '../../entities/movie_ui_entity.dart';
import '../movies_list/movies_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.neonBlue,
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildBigBcCircle(context),
              _buildSmallBcCircle(context),
              _buildContent(context, orientation),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBigBcCircle(BuildContext context) {
    return Positioned(
      top: -350,
      right: -350,
      width: 700,
      height: 700,
      child: _buildBcCircle(),
    );
  }

  Widget _buildSmallBcCircle(BuildContext context) {
    return Positioned(
      bottom: -250,
      left: -250,
      width: 500,
      height: 500,
      child: _buildBcCircle(),
    );
  }

  Container _buildBcCircle() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightSlateBlue,
        shape: BoxShape.circle,
      ),
    );
  }

  Positioned _buildContent(BuildContext context, Orientation orientation) {
    return Positioned(
      top: 0,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogoImage(context),
            _buildLabel(context),
            if (orientation == Orientation.portrait)
              _buildPortraitViewButtons(context)
            else
              _buildLandscapeViewButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _buildLogoImage(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Image(
        image: AssetImage('assets/images/logo.png'),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          MoviesAppLocalizations.mainScreenText,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }

  Widget _buildPortraitViewButtons(BuildContext context) {
    return Column(
      children: _buildButtonChildren(context),
    );
  }

  Row _buildLandscapeViewButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildButtonChildren(context),
    );
  }

  List<Widget> _buildButtonChildren(BuildContext context) {
    return [
      _buildButton(
        context: context,
        text: MoviesAppLocalizations.mainScreenBlocBtnText,
        onPress: openFilmsListScreenByBloc,
      ),
      _buildButton(
        context: context,
        text: MoviesAppLocalizations.mainScreenMVVMBtnText,
        onPress: openFilmsListScreenByMVVM,
      ),
    ];
  }

  Widget _buildButton({
    required String text,
    required BuildContext context,
    required Function(BuildContext context) onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50,
        width: 300,
        child: ElevatedButton(
          onPressed: () {
            onPress(context);
          },
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }

  void openFilmsListScreenByBloc(BuildContext context) async {
    //TODO: Edit this function to open bloc architecture
    List<MovieUIEntity> movies = mapFilmUIEntityListToDataEntityList(
        await GetIt.I<MoviesRepository>().getFilmsList());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoviesListScreen(
          movies: movies,
        ),
      ),
    );
  }

  void openFilmsListScreenByMVVM(BuildContext context) async {
    //TODO: Edit this function to open mvvm architecture
    List<MovieUIEntity> movies = mapFilmUIEntityListToDataEntityList(
        await GetIt.I<MoviesRepository>().getFilmsList());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MoviesListScreen(
          movies: movies,
        ),
      ),
    );
  }
}
