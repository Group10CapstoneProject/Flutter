import 'package:capstone_alterra_flutter/provider/class_provider.dart';
import 'package:capstone_alterra_flutter/provider/trainer_provider.dart';
import 'package:capstone_alterra_flutter/screen/trainers/all_trainers.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
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
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: DatePicker(
        DateTime.now(),
        height: 85,
        width: 50,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryBase,
        locale: 'id_ID',
        onDateChange: (date) {
          selectedDate = date;
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
          Text(
            'Pilih Personal Trainer Kamu!',
            style: kSubtitle1.copyWith(
              color: blackColor,
            ),
          ),
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
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
        ],
      ),
    );
  }
}
