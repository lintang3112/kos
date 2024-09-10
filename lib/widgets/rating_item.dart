import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key, required this.rating, required this.index});

  final int rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/images/icon_star.png'
          : 'assets/images/icon_star_grey.png',
      width: 20,
    );
  }
}
