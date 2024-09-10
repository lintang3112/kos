import 'package:flutter/material.dart';
import 'package:kos/pages/home_page.dart';
import 'package:kos/theme.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error.png',
                width: 300,
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Where are you going ?",
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(purpleColor),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
