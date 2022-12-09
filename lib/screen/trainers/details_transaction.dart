import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:capstone_alterra_flutter/screen/trainers/booking_trainers.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/widget/separator.dart';
import 'package:capstone_alterra_flutter/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTranscation extends StatelessWidget {
  const DetailTranscation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        iconTheme: const IconThemeData(color: Colors.black),
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
                'Kamu akan memesan pelatih ini',
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
                      color: blackColor.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dika Pramudya',
                            style: kSubtitle1.copyWith(color: blackColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'RP 275.000',
                            style: GoogleFonts.roboto(
                              color: blackLight,
                              fontSize: 16,
                              fontWeight: semiBold,
                              letterSpacing: 0.15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'Pelatih',
                        style: kCaption.copyWith(color: warningDark),
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
                      'Detail Pemesanan',
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
                            inputDate.text,
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
                          '11:00',
                          style: GoogleFonts.roboto(
                            color: blackColor,
                            fontSize: 14,
                            fontWeight: semiBold,
                            letterSpacing: 0.1,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/trainer/telpon.svg'),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Nomor Telepon',
                                style: kBody2.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                          Text(
                            '+62${inputNumber.text}',
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
                        Flexible(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/trainer/note.svg'),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                'Catatan',
                                style: kBody2.copyWith(color: blackColor),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            inputNote.text,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              color: blackColor,
                              fontSize: 14,
                              fontWeight: semiBold,
                              letterSpacing: 0.1,
                            ),
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
                          'RP 275.000',
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
                          'RP 275.000',
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
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                          (route) => false);
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
