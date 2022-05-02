import 'package:films_app_trainee_task/features/theme/colors.dart';

import 'package:flutter/material.dart';

class ShadowGradientWidget extends StatelessWidget {
  const ShadowGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.transparent,
              AppColors.transparent,
              AppColors.blackRock,
            ],
          ),
        ),
      ),
    );
  }
}
