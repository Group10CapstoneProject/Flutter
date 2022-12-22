import 'package:capstone_alterra_flutter/model/category_trainer_model.dart';
import 'package:capstone_alterra_flutter/model/trainers_model.dart';
import 'package:capstone_alterra_flutter/screen/trainers/booking_trainers.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailTrainerScreen extends StatelessWidget {
  final TrainerModel detailTrainer;
  const DetailTrainerScreen({super.key, required this.detailTrainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
        ),
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'Detail Pelatih',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image
            SizedBox(
              child: Image.asset(
                detailTrainer.avatar,
                width: MediaQuery.of(context).size.width,
                height: 210,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(detailTrainer.name, style: kHeading6),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/trainer/medal.png',
                              height: 24,
                              width: 24,
                            ),
                            Text(
                              'Bersertifikat',
                              style: kCaption,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 24,
                            color: primaryBase,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '20 Active Client',
                            style: kSubtitle2.copyWith(color: blackBase),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.work_history,
                            size: 24,
                            color: primaryBase,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '${detailTrainer.experience} Tahun Pengalaman',
                            style: kSubtitle2.copyWith(color: blackBase),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      Text(
                        Utils.currencyFormat(detailTrainer.price),
                        style: kSubtitle1.copyWith(color: blackBase),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    height: 35,
                    child: ListView.separated(
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final categoryPelat = categoryList[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryLighter),
                          child: Center(
                            child: Text(
                              categoryPelat.name,
                              style: kSubtitle2,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10.0,
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/trainer/phone.svg'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset('assets/trainer/instagram.svg'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset('assets/trainer/email.svg'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentang Pelatih',
                          style: kSubtitle1,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          detailTrainer.description,
                          style: kBody2.copyWith(color: blackLight),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryLightest,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
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
                              'Setelah memesan sesi pelatih, pelatih akan menghubungi Anda untuk mengonfirmasinya. Harap beri tahu pelatih jika Anda memiliki kondisi medis apa pun',
                              style: kBody2.copyWith(color: blackColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
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
                  //     builder: (context) => const BookingTrainers(),
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
                child: const Text('BOOK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
