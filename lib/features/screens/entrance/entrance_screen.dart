import 'package:films_app_trainee_task/data/repositories/actors/actors_repository_impl.dart';
import 'package:films_app_trainee_task/data/repositories/movies/movies_repository_puts_req_impl.dart';
import 'package:films_app_trainee_task/domain/repositories/actors/actors_repository.dart';
import 'package:films_app_trainee_task/domain/repositories/movies/movies_repository.dart';
import 'package:films_app_trainee_task/features/screens/entrance/widgets/carousel_slider.dart';
import 'package:films_app_trainee_task/features/screens/entrance/widgets/circles.dart';
import 'package:films_app_trainee_task/features/screens/entrance/widgets/elevated_button.dart';
import 'package:films_app_trainee_task/features/screens/entrance/widgets/screen_labels.dart';
import 'package:films_app_trainee_task/features/screens/entrance/widgets/shadow_gradient.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/mvvm/movies_list_view.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/mvvm/movies_list_view_model.dart';
import 'package:films_app_trainee_task/features/theme/colors.dart';
import 'package:films_app_trainee_task/localisation.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class EntranceScreen extends StatelessWidget {
  const EntranceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.neonBlue,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const CarouselSliderWidget(),
            const TopRightBcCircleWidget(),
            const BottomLeftBcCircleWidget(),
            const ShadowGradientWidget(),
            const EntranceScreenHeadlineWidget(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Positioned.fill(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const EntranceScreenCaptionWidget(),
                if (orientation == Orientation.portrait)
                  _buildPortraitViewButtons(context)
                else
                  _buildLandscapeViewButtons(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPortraitViewButtons(BuildContext context) {
    return Column(
      children: _buildButtonChildren(context),
    );
  }

  Widget _buildLandscapeViewButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildButtonChildren(context),
    );
  }

  List<Widget> _buildButtonChildren(BuildContext context) {
    return [
      CustomElevatedButtonWidget(
        btnLabel: MoviesAppLocalizations.entranceScreenBlocBtnText,
        onPress: () => _openFilmsListScreenByBloc(context),
      ),
      CustomElevatedButtonWidget(
        btnLabel: MoviesAppLocalizations.entranceScreenMVVMBtnText,
        onPress: () => _openFilmsListScreenByMVVM(context),
      ),
    ];
  }

  void _openFilmsListScreenByBloc(BuildContext context) {
    Navigator.pushNamed(context, MoviesAppLocalizations.moviesListCubitScreenName);
  }

  void _openFilmsListScreenByMVVM(BuildContext context) {
    _setUp();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MoviesListViewModel()),
          ],
          child: MoviesListView(),
        ),
      ),
    );
  }

  void _setUp() {
    if (!GetIt.I.isRegistered<MoviesRepository>()) {
      GetIt.I.registerSingleton<MoviesRepository>(MoviesRepositoryPutsReqImpl());
    }
    if (!GetIt.I.isRegistered<ActorsRepository>()) {
      GetIt.I.registerSingleton<ActorsRepository>(ActorsRepositoryImpl());
    }
  }
}
