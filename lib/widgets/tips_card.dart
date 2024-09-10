import 'package:flutter/material.dart';
import 'package:kos/models/tips.dart';
import 'package:kos/theme.dart';

class TIpsCard extends StatelessWidget {
  const TIpsCard({super.key, this.tips});

  final Tips? tips;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips!.imageUrl,
          width: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips!.title,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Update ${tips!.updateAt}",
              style: greyTextStyle,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_right, color: greyColor),
        ),
      ],
    );
  }
}
