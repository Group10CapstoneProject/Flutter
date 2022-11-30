import 'package:capstone_alterra_flutter/screen/offline/offline_card.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';

class OfflineScreen extends StatefulWidget {
  const OfflineScreen({super.key});

  @override
  State<OfflineScreen> createState() => _OfflineScreenState();
}

class _OfflineScreenState extends State<OfflineScreen> {
  bool isSelected = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Filter
          filter(),

          const SizedBox(
            height: 14.0,
          ),

          // WidgetCard
          const OfflineCard(
            title: 'Basic Yoga',
            teacher: 'With Maya',
            date: '05.30',
            duration: '60 min',
            availabeleSlot: '10 Slot Tersisa',
            payment: '30.000',
            picture: 'assets/offline_page/image.png',
          ),
          const SizedBox(
            height: 20.0,
          ),
          const OfflineCard(
            title: 'Muay Thai',
            teacher: 'With Kevin',
            date: '16.00',
            duration: '65 min',
            availabeleSlot: '20 Slot Tersisa',
            payment: '150.000',
            picture: 'assets/offline_page/image_2.png',
          ),
          const SizedBox(
            height: 20.0,
          ),
          const OfflineCard(
            title: 'zumba',
            teacher: 'With Randy',
            date: '19.00',
            duration: '60 min',
            availabeleSlot: '15 Slot Tersisa',
            payment: '80.000',
            picture: 'assets/offline_page/image_3.png',
          ),
        ],
      ),
    );
  }

  // Kumpulan Filter
  Widget filter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: whiteBase,
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
                style: TextStyle(color: blackColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
