import 'package:carousel_slider/carousel_slider.dart';
import 'package:films_app_trainee_task/constants_paths.dart';

import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const imgList = ConstantsPaths.entranceScreenImgList;
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = imgList[index];
        return _buildCarouselItem(
          imgUrl,
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: double.infinity,
        viewportFraction: 1,
      ),
    );
  }

  Widget _buildCarouselItem(String imgUrl) {
    return SizedBox(
      width: double.infinity,
      child: Image(
        image: AssetImage(imgUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
