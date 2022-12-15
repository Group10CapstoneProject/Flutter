import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OfflineBook extends StatelessWidget {
  const OfflineBook({
    super.key,
    required this.model,
  });

  final OfflineModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
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
      body: Stack(
        children: [
          SizedBox(
            child: Image.network(
              model.picture!,
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
                            Expanded(
                              child: Text(
                                model.title!,
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: blackColor,
                                    letterSpacing: 0.15,
                                    fontWeight: medium),
                              ),
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
                                  style: kSubtitle2.copyWith(color: blackBase),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.offlineClassCategory!.name!,
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
                                    Utils.dateTimeFormat(model.time),
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
                                    model.location!,
                                    style: kSubtitle2.copyWith(
                                      color: blackBase,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Utils.currencyFormat(model.price!),
                                    style: GoogleFonts.roboto(
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
                        ),
                        Divider(
                          color: whiteDarker,
                          thickness: 1,
                        ),

                        // Deskripsi Kelas
                        descriptionClass(),
                        Divider(
                          color: whiteDarker,
                          thickness: 1,
                        ),

                        // Profile Instruktur
                        instrukturClass(),
                        Divider(
                          color: whiteDarker,
                          thickness: 1,
                        ),

                        // Deskripsi Time
                        descriptionTime(),
                        Divider(
                          color: whiteDarker,
                          thickness: 1,
                        ),

                        // Notifikasi Kelas
                        notificationClass(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
                  //     builder: (context) => TransactionDetailScreen(
                  //         transactionModel: TransactionModel.forOfflineClass(
                  //             id: '1',
                  //             title: widget.title,
                  //             price: widget.price,
                  //             date: widget.duration.toString(),
                  //             time: widget.time)),
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

  // Deskripsi Kelas
  Widget descriptionClass() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
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
            model.offlineClassCategory!.description!,
            style: kBody2.copyWith(color: blackLight),
          ),
        ],
      ),
    );
  }

  // Instruktur Kelas
  Widget instrukturClass() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                child: Image.network(
                  model.offlineClassCategory!.picture! == ''
                      ? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJrN_k4tIwtR9Cb2ZSfB_3F88RfNsTr2BCAQ&usqp=CAU'
                      : model.offlineClassCategory!.picture!,
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
                    model.offlineClassCategory!.name!,
                    style: kSubtitle1.copyWith(color: blackColor),
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
        ],
      ),
    );
  }

  // Deskripsi Waktu
  Widget descriptionTime() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }

  // Notifikasi Kelas
  Widget notificationClass() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: primaryLightest, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 10, bottom: 20, right: 10),
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
    );
  }
}
