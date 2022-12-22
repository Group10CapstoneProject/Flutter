import 'package:capstone_alterra_flutter/provider/notification_provider.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late PageController pageController;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    pageController = PageController(
      initialPage: (context.read<NotificationProvider>().isPromo) ? 0 : 1,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          'Notifikasi',
          style: kHeading6.copyWith(color: blackLight),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'HAPUS SEMUA',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: medium,
                  color: const Color(0xFF802A14),
                  letterSpacing: 1.25,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: [
            notification(),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: const [
                  Text('A'),
                  Text('B'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget notification() {
    return Consumer<NotificationProvider>(
      builder: (context, value, child) {
        return Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    value.isPromo ? const Color(0xFFF2F4F3) : primaryBase,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
                value.setisPromo(false);
              },
              child: Text(
                'Info',
                style: TextStyle(
                  color: value.isPromo ? primaryBase : whiteBase,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    value.isPromo ? primaryBase : const Color(0xFFF2F4F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
                value.setisPromo(true);
              },
              child: Text(
                'Promo',
                style: TextStyle(
                  color: value.isPromo ? whiteBase : blackLightest,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
