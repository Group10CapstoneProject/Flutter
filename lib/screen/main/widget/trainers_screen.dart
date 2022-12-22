import 'package:capstone_alterra_flutter/provider/class_provider.dart';
import 'package:capstone_alterra_flutter/provider/offline_provider.dart';
import 'package:capstone_alterra_flutter/provider/trainer_provider.dart';
import 'package:capstone_alterra_flutter/screen/trainers/all_trainers.dart';
import 'package:capstone_alterra_flutter/screen/trainers/filter_trainers.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TrainersScreen extends StatefulWidget {
  const TrainersScreen({super.key});

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Pelatih',
          style: kHeading6.copyWith(color: blackLight),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              // height: 120,
              child: Column(
                children: [
                  // Waktu
                  Consumer<ClassProvider>(builder: (context, value, child) {
                    if (value.isOfflineChoosen) {
                      return waktu();
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),

            // Filter
            filter(),

            // Trainer
            Consumer<TrainerProvider>(
              builder: (context, value, child) {
                final data = value.listTrainer;
                return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AllTrainers(trainerModel: data[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Manggil Waktu
  Widget waktu() {
    return SizedBox(
      height: 88,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DateTime waktu = selectedDate.add(
            Duration(days: index),
          );
          return SizedBox(
            // margin: EdgeInsets.only(left: (index == 0) ? 5 : 0),
            width: 70,
            child: FittedBox(
              fit: BoxFit.none,
              child: Consumer<OfflineProvider>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.setSwap(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 60,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (value.swap == index) ? primaryBase : whiteColor,
                        border: Border.all(
                          color: (value.swap == index)
                              ? primaryBase
                              : whiteDarkest,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                Utils.dateTimeFormat7(waktu),
                                style: kCaption.copyWith(
                                  fontWeight: medium,
                                  fontSize: 14,
                                  color: (value.swap == index)
                                      ? whiteBase
                                      : blackLightest,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                Utils.dateTimeFormat8(waktu),
                                style: kCaption.copyWith(
                                  fontSize: 12,
                                  color: (value.swap == index)
                                      ? whiteBase
                                      : blackLightest,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Kumpulan Filter
  Widget filter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Pilih Personal Trainer Kamu!',
              style: kSubtitle1.copyWith(
                color: blackColor,
              ),
            ),
          ),
          Flexible(
            child: SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrainerFilterScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.tune,
                  color: blackColor,
                ),
                label: Text(
                  'Filter',
                  style: TextStyle(
                    color: blackColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
