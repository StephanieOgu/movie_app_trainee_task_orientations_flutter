import 'package:films_app_trainee_task/constants_paths.dart';
import 'package:films_app_trainee_task/features/theme/colors.dart';

import 'package:flutter/material.dart';

class AppBarImageBcImage extends StatelessWidget {
  const AppBarImageBcImage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          _buildAppBarImgShadow(),
        ],
      ),
      child: _buildImage(),
    );
  }

  BoxShadow _buildAppBarImgShadow() {
    return BoxShadow(
      color: AppColors.lightGrey,
      offset: const Offset(0.0, 2.0),
      blurRadius: 6.0,
    );
  }

  ClipRRect _buildImage() {
    const String imagePath = ConstantsPaths.moviesListWidgetImg;
    return const ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
      child: Image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }
}
