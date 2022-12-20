import 'package:barcode_widget/barcode_widget.dart';
import 'package:capstone_alterra_flutter/model/offline_class_booking_model.dart';
import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_widget/ticket_widget.dart';

class KodeUnik extends StatelessWidget {
  const KodeUnik({super.key, required this.offlineBookModel});

  final OfflineBookingModel offlineBookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'Detail',
          style: kHeading6.copyWith(color: blackLight),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff52A1A4),
                  ),
                  child: TicketWidget(
                    width: MediaQuery.of(context).size.width,
                    height: 530,
                    isCornerRounded: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            'Basic Yoga - With Maya',
                            style: kSubtitle1.copyWith(color: blackLight),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: kBody2.copyWith(
                                            color: whiteDarkest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Nama',
                                          style: kBody2.copyWith(
                                            color: whiteDarkest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          'Jam',
                                          style: kBody2.copyWith(
                                            color: whiteDarkest,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          'Kelas',
                                          style: kBody2.copyWith(
                                            color: whiteDarkest,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Senin, 20 Nov 2022',
                                          style: kBody2.copyWith(
                                            color: blackLight,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          'Kelompok 10',
                                          style: kBody2.copyWith(
                                            color: blackLight,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          '05.30',
                                          style: kBody2.copyWith(
                                            color: blackLight,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          'Offline',
                                          style: kBody2.copyWith(
                                            color: blackLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'Kode Unik',
                                style: kSubtitle1,
                              ),
                              BarcodeWidget(
                                data: offlineBookModel.code.toString(),
                                style: kHeading6,
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 7),
                                barcode: Barcode.code128(),
                                width: 164,
                                height: 70,
                              ),
                              const DottedLine(
                                dashLength: 1.0,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 22),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/offline_page/Vector.svg'),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      'Cara menggunakan kode unik',
                                      style: kSubtitle1.copyWith(
                                          color: blackLight),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1.',
                                      style: kBody2.copyWith(color: blackLight),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Tunjukan kode unik untuk melakukan konfirmasi pada saat datang ke klub AltaGym',
                                        style:
                                            kBody2.copyWith(color: blackLight),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '2.',
                                      style: kBody2.copyWith(color: blackLight),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Pindai barcode kode unik anda',
                                        style:
                                            kBody2.copyWith(color: blackLight),
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
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: whiteColor,
        height: 88,
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (route) => false);
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
                  'KEMBALI KE BERANDA',
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
