import 'package:flutter/material.dart';
import 'package:kos/models/city.dart';
import 'package:kos/theme.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xfff6f7f8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city!.imageUrl,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city!.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(34),
                            ),
                          ),
                          height: 30,
                          width: 50,
                          child: Center(
                            child: Image.asset(
                              'assets/images/icon_star.png',
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              city!.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
