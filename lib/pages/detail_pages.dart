import 'package:flutter/material.dart';
import 'package:kos/models/space.dart';
import 'package:kos/pages/error_page.dart';
import 'package:kos/theme.dart';
import 'package:kos/widgets/facility_item.dart';
import 'package:kos/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.space,
  });

  final Space? space;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // final Uri _url = Uri.parse("https://maps.app.goo.gl/kt6TLVJ14Vz7nGeUA");

  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl(String) async {
      if (await launchUrl(Uri.parse(widget.space!.mapUrl!))) {
        launchUrl(Uri.parse(widget.space!.mapUrl!));
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Apakah Kamu ingin menelepon pemilik kos'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Hubungi'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final Uri _telp =
                        Uri(scheme: 'tel', path: widget.space!.phone);
                    if (await canLaunchUrl(_telp)) {
                      await launchUrl(_telp);
                    } else {
                      throw (_telp);
                    }
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space!.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      // Note: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space!.name!,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space!.price!}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: '/ month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: const EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: widget.space!.rating!,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Populer Cities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItems(
                                imageUrl: 'assets/images/icon_kitchen.png',
                                name: 'Kitchen',
                                total: widget.space!.numberofKitchen!),
                            FacilityItems(
                                imageUrl: 'assets/images/icon_bedroom.png',
                                name: 'Bedroom',
                                total: widget.space!.numberofBedrooms!),
                            FacilityItems(
                                imageUrl: 'assets/images/icon_cupboard.png',
                                name: 'Cupboard',
                                total: widget.space!.numberofCupboards!),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE: PHOTO
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space!.photos!.map(
                            (item) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  left: 24,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          "Location",
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.space!.address}\n${widget.space!.city}",
                              style: greyTextStyle,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(whiteColor),
                                elevation: WidgetStateProperty.all(0),
                              ),
                              onPressed: () {
                                _launchUrl(widget.space!.mapUrl!);
                              },
                              child: Image.asset(
                                "assets/images/btn_map.png",
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(purpleColor),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            showConfirmation();
                            // final Uri _telp =
                            //     Uri(scheme: 'tel', path: widget.space!.phone);
                            // if (await canLaunchUrl(_telp)) {
                            //   await launchUrl(_telp);
                            // } else {
                            //   throw (_telp);
                            // }
                          },
                          child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isClicked = !_isClicked;
                      });
                    },
                    child: Image.asset(
                      _isClicked
                          ? 'assets/images/btn_wishlist.png'
                          : 'assets/images/btn_wishlist_active.png',
                      width: 40,
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
