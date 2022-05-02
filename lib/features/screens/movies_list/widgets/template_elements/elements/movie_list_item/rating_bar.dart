import 'package:flutter/cupertino.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required this.rating,
    required this.color,
  }) : super(key: key);

  final double rating;
  final Color color;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: RatingBar.builder(
        initialRating: rating,
        ignoreGestures: true,
        itemSize: 15,
        itemCount: 5,
        allowHalfRating: true,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          CupertinoIcons.tickets_fill,
          color: color,
        ),
        onRatingUpdate: (rating) {},
      ),
    );
  }
}
