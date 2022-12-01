import 'package:capstone_alterra_flutter/screen/main/widget/class_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/separator.dart';
import 'package:capstone_alterra_flutter/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RincianTransaksi extends StatefulWidget {
  const RincianTransaksi({super.key});

  @override
  State<RincianTransaksi> createState() => _RincianTransaksiState();
}

class _RincianTransaksiState extends State<RincianTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'Rincian Transaksi',
          style: kHeading6.copyWith(color: blackLight),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kamu akan memesan kelas ini',
                style: kBody1.copyWith(color: blackColor),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 24,
                ),
                padding: const EdgeInsets.fromLTRB(14, 20, 14, 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Basic Yoga - With Maya',
                          style: kSubtitle1.copyWith(color: blackColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'RP 50.000',
                          style: GoogleFonts.roboto(
                            color: blackLight,
                            fontSize: 16,
                            fontWeight: semiBold,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          'kelas offline',
                          style: kCaption.copyWith(color: warningDark),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: whiteDarker,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Kelas',
                      style: kSubtitle1.copyWith(color: blackColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.event,
                                size: 24,
                                color: primaryBase,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Tanggal Sesi',
                                style: kBody2.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                          Text(
                            '20 November 2022',
                            style: GoogleFonts.roboto(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 0.1,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.clock,
                              size: 24,
                              color: primaryBase,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Jam Sesi',
                              style: kBody2.copyWith(color: blackColor),
                            ),
                          ],
                        ),
                        Text(
                          '05:30',
                          style: GoogleFonts.roboto(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: semiBold,
                            letterSpacing: 0.1,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: whiteDarker,
                thickness: 1,
              ),
              const SizedBox(
                height: 14.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rincian Pembayaran',
                      style: kSubtitle1.copyWith(color: blackColor),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Harga Kelas',
                          style: kBody2.copyWith(color: blackColor),
                        ),
                        Text(
                          'RP 50.000',
                          style: GoogleFonts.roboto(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: semiBold,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount',
                            style: kBody2.copyWith(color: blackColor)),
                        Text(
                          '-',
                          style: GoogleFonts.roboto(
                            color: infoBase,
                            fontSize: 14,
                            fontWeight: regular,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                    MySeparator(),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total bayar',
                          style: kBody2.copyWith(color: blackColor),
                        ),
                        Text(
                          'RP 50.000',
                          style: GoogleFonts.roboto(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: semiBold,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: whiteColor,
        height: 124,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBase,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'PILIH METODE PEMBAYARAN',
                    style: kButton.copyWith(color: whiteBase),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  dialogButton(
                    context,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassScreen(),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'BATALKAN PESANAN',
                  style: kButton.copyWith(color: dangerDarker),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
