import 'package:films_app_trainee_task/features/theme/colors.dart';

import 'package:flutter/material.dart';

class TopRightBcCircleWidget extends StatelessWidget {
  const TopRightBcCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: -350,
      right: -350,
      width: 700,
      height: 700,
      child: _Circle(),
    );
  }
}

class BottomLeftBcCircleWidget extends StatelessWidget {
  const BottomLeftBcCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: -250,
      left: -250,
      width: 500,
      height: 500,
      child: _Circle(),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightSlateBlue,
      ),
    );
  }
}
