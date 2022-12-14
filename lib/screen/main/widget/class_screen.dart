import 'package:capstone_alterra_flutter/provider/class_provider.dart';
import 'package:capstone_alterra_flutter/provider/offline_provider.dart';
import 'package:capstone_alterra_flutter/screen/offline/offline_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/screen/online/online_class_screen.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  DateTime selectedDate = DateTime.now();
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    pageController = PageController(
      initialPage: (context.read<ClassProvider>().isOfflineChoosen) ? 0 : 1,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Kelas',
          style: kHeading6.copyWith(color: blackLight),
        ),
        elevation: 0,
      ),

      // Body
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
            ),
            // height: 200,
            child: Column(
              children: [
                // Daftar Kelas
                daftarKelas(),

                // Waktu
                Consumer<ClassProvider>(builder: (context, value, child) {
                  if (value.isOfflineChoosen) {
                    return waktu();
                  } else {
                    return const SizedBox(
                      height: 10,
                    );
                  }
                }),
              ],
            ),
          ),

          ///PageView
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [OfflineScreen(), OnlineClassScreen()],
            ),
          )
        ],
      ),
    );
  }

  // Kelas Offline dan Online
  Widget daftarKelas() {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 49,
      decoration: BoxDecoration(
        border: Border.all(color: whiteDarker),
        color: const Color(0xFFF2F4F3),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: 175,
              height: 39,
              child: Consumer<ClassProvider>(
                builder: (context, value, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: !value.isOfflineChoosen
                        ? const Color(0xFFF2F4F3)
                        : primaryBase,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    value.setIsOfflineChoosen(true);
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.ease);
                  },
                  child: Text(
                    'Offline',
                    style: TextStyle(
                      color: !value.isOfflineChoosen ? primaryBase : whiteBase,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: SizedBox(
              width: 175,
              height: 39,
              child: Consumer<ClassProvider>(
                builder: (context, value, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: !value.isOfflineChoosen
                        ? primaryBase
                        : const Color(0xFFF2F4F3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    value.setIsOfflineChoosen(false);
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.ease);
                  },
                  child: Text(
                    'Online',
                    style: TextStyle(
                      color: !value.isOfflineChoosen ? whiteBase : primaryBase,
                    ),
                  ),
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
                      DateTime time = DateTime.now().add(Duration(days: index));
                      String date = Utils.timeDate(time);
                      value.getOfflineClass(time: date, categoryId: null, orderByPrice: 'DESC');
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
  // Widget waktu() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 30),
  //     child: DatePicker(
  //       DateTime.now(),
  //       height: 85,
  //       width: 50,
  //       initialSelectedDate: DateTime.now(),
  //       selectionColor: primaryBase,
  //       locale: 'id_ID',
  //       onDateChange: (date) {
  //         selectedDate = date;
  //       },
  //     ),
  //   );
  // }

  // Kumpulan Filter
  Widget filter() {
    return Container(
      margin: const EdgeInsets.only(top: 11, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
