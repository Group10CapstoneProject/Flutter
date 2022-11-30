import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OfflineBook extends StatelessWidget {
  const OfflineBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'Detail Kelas',
          style: kHeading6.copyWith(color: blackLight),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_rounded),
            color: blackColor,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              child: Image.asset(
                'assets/offline_page/image.png',
                width: MediaQuery.of(context).size.width,
                height: 192,
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 80),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                    color: whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: whiteDarker,
                              height: 4,
                              width: 48,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Basic Yoga',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: blackColor,
                                    letterSpacing: 0.15,
                                    fontWeight: medium),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: primaryBase,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '4.5',
                                    style:
                                        kSubtitle2.copyWith(color: blackBase),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 14.5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maya Rochima',
                                style: kBody1.copyWith(color: blackLight),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.event_outlined,
                                    color: primaryBase,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    '20 November dari 05.30 - 06.30',
                                    style:
                                        kSubtitle2.copyWith(color: blackBase),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.63,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: primaryBase,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Gedung Alterra, Malang',
                                    style: kSubtitle2.copyWith(
                                      color: blackBase,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '20.3km',
                                    style:
                                        kCaption.copyWith(color: whiteDarkest),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'RP 50.000',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: bold,
                                      letterSpacing: 0.15,
                                      color: blackBase,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    '/Kelas',
                                    style: kBody2.copyWith(color: whiteDarkest),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Divider(
                            color: whiteDarker,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi Kelas',
                                style: kSubtitle1.copyWith(color: blackColor),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                'Basic yoga cocok untuk pemula untuk membantu keseimbangan tubuh. Basic yoga melibatkan serangkaian gerakan, kecepatan dan ritme pernapasan sehingga membuat kamu merasa terpusat dan tenang.',
                                style: kBody2.copyWith(color: blackLight),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Divider(
                            color: whiteDarker,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Instruktur',
                            style: kSubtitle1.copyWith(color: blackColor),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/offline_page/image_4.png',
                                  width: 69,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maya Rochima',
                                    style:
                                        kSubtitle1.copyWith(color: blackColor),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.squareInstagram,
                                        color: primaryBase,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      Icon(
                                        FontAwesomeIcons.squareFacebook,
                                        color: primaryBase,
                                        size: 30,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Divider(
                            color: whiteDarker,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Waktu Tiba',
                            style: kSubtitle1.copyWith(color: blackColor),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.share_arrival_time_rounded,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                '15 menit sebelum kelas di mulai',
                                style: kSubtitle2.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Divider(
                            color: whiteDarker,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: primaryLightest,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, bottom: 20, right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.info_outline,
                                    size: 24,
                                    color: Color(0xFF1C1B1F),
                                  ),
                                  const SizedBox(
                                    width: 16.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Kami menerima pemesanan maksimal H- 3 jam sebelum kelas dimulai. \n\nHarap batalkan 1 jam sebelum kelas dimulai. \n\nKamu hanya dapat mengubah jadwal kamu 24 jam sebelum kelas dimulai.',
                                      style: kBody2.copyWith(color: blackColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: whiteColor,
        height: 102,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const RincianTransaksi(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBase,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'BOOK',
                  style: kButton.copyWith(color: whiteBase),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
