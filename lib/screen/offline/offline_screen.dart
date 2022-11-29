import 'package:capstone_alterra_flutter/screen/offline/widget/offline_card.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          'Kelas',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        elevation: 0,
      ),

      // Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              height: 200,
              child: Column(
                children: [
                  // Daftar Kelas
                  daftarKelas(),

                  // Waktu
                  waktu(),
                ],
              ),
            ),

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
              payment: 30000,
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
              payment: 150000,
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
              payment: 150000,
              picture: 'assets/offline_page/image.png',
            ),
          ],
        ),
      ),
    );
  }

  // Kelas Offline dan Online
  Widget daftarKelas() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 49,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD3D3D3)),
        color: const Color(0xFFF2F4F3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 175,
            height: 39,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: isSelected
                    ? const Color(0xFFF2F4F3)
                    : const Color(0xFF52A1A4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                setState(() {
                  isSelected = false;
                });
              },
              child: Text(
                'Offline',
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF52A1A4)
                      : const Color(0xFFFDFDFD),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 175,
            height: 39,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: isSelected
                    ? const Color(0xFF52A1A4)
                    : const Color(0xFFF2F4F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                setState(() {
                  isSelected = true;
                });
              },
              child: Text(
                'Online',
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFFFDFDFD)
                      : const Color(0xFF52A1A4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Manggil Waktu
  Widget waktu() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: DatePicker(
        DateTime.now(),
        height: 80,
        width: 50,
        initialSelectedDate: DateTime.now(),
        selectionColor: const Color(0xFF52A1A4),
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
      margin: const EdgeInsets.only(top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: 100,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                color: Color(0xFF000000),
              ),
              label: const Text(
                'Filter',
                style: TextStyle(
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
