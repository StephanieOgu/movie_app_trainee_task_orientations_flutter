import 'package:films_app_trainee_task/domain/entities/movie.dart';
import 'package:films_app_trainee_task/features/screens/movie_details/widgets/movie_details_widget.dart';
import 'package:films_app_trainee_task/features/screens/movies_list/entities/details_screen_pop_result.dart';

import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({
    Key? key,
    this.selectedMovie,
  }) : super(key: key);

  final Movie? selectedMovie;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(),
        extendBodyBehindAppBar: true,
        body: OrientationBuilder(
          builder: (builder, orientation) {
            if (orientation == Orientation.landscape) {
              _popFlip(context);
            }
            return selectedMovie != null
                ? MovieDetailsWidget(
                    movie: selectedMovie,
                  )
                : Container();
          },
        ),
      ),
      onWillPop: () => _popReturn(context),
    );
  }

  void _popFlip(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Navigator.of(context).pop(DetailsScreenPopResult.changeOrientation);
      },
    );
  }

  Future<bool> _popReturn(BuildContext context) {
    Navigator.of(context).pop(DetailsScreenPopResult.unselectMovie);
    return Future.value(false);
  }
}
