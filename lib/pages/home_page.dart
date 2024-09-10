import 'package:flutter/material.dart';
import 'package:kos/models/space.dart';
import 'package:kos/models/tips.dart';
import 'package:kos/provider/space_provider.dart';
import 'package:kos/theme.dart';
import 'package:kos/widgets/bottom_navbar_item.dart';
import 'package:kos/widgets/city_card.dart';
import 'package:kos/models/city.dart';
import 'package:kos/widgets/space_card.dart';
import 'package:kos/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang nyaman',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: POPULER CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Populer Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    city: City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.png',
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5.png',
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    city: City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6.png',
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: RECOMANDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomanded Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(space: item),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TIpsCard(
                    tips: Tips(
                        id: 1,
                        title: "City & Guidlines",
                        imageUrl: "assets/images/tips1.png",
                        updateAt: "20 April"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TIpsCard(
                    tips: Tips(
                        id: 2,
                        title: "Jakarta Fairship",
                        imageUrl: "assets/images/tips2.png",
                        updateAt: "11 Desember"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width -
            (2 * edge), // menyesuaikan lebar setiap perangkat
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: const Color(0xfff6f7f8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbar(
              imageUrl: "assets/images/icon_home.png",
              isActive: true,
            ),
            BottomNavbar(
              imageUrl: "assets/images/icon_email.png",
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: "assets/images/icon_card.png",
              isActive: false,
            ),
            BottomNavbar(
              imageUrl: "assets/images/icon_love.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // agar navbar nya tidak hilang
    );
  }
}
