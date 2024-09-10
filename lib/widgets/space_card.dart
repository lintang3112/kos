import 'package:flutter/material.dart';
import 'package:kos/models/space.dart';
import 'package:kos/pages/detail_pages.dart';
import 'package:kos/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space? space;

  const SpaceCard({super.key, this.space});
// Note: Recomanded Space
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              space: space,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    space!.imageUrl!,
                    height: 110,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(34),
                        ),
                      ),
                      height: 30,
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icon_star.png',
                            height: 22,
                            width: 22,
                          ),
                          Text(
                            '${space?.rating ?? ""}/5',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space?.name ?? "",
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 2,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space?.price ?? ""}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: '/ month',
                        style: greyTextStyle.copyWith(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${space?.city ?? ""}, ${space?.country ?? ""}',
                style: greyTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
