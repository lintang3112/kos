import 'package:flutter/material.dart';
import 'package:kos/pages/home_page.dart';
import 'package:kos/theme.dart';

class SplasPage extends StatelessWidget {
  const SplasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false, // fungsi agar gambar tidak tertutup
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/splash_image.png')),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Find Cozy House\nto Stay and Happy',
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Stop membuang banyak waktu\npada tempat yang tidak habib table",
                    style: greyTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(purpleColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      child: Text(
                        'Explore Now',
                        style: whiteTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
