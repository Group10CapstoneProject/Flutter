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
      initialPage: (context.read<NotificationProvider>().isInfo) ? 0 : 1,
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
      body: Column(
        children: [
          notification(),

          // Widget Info & Promo
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                /// Info
                info(),

                /// promo
                promo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget notification() {
    return Consumer<NotificationProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      value.isInfo ? primaryBase : const Color(0xFFF2F4F3),
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
                  value.setisInfo(true);
                },
                child: Text(
                  'Info',
                  style: TextStyle(
                    color: value.isInfo ? whiteBase : blackLightest,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      value.isInfo ? const Color(0xFFF2F4F3) : primaryBase,
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
                  value.setisInfo(false);
                },
                child: Text(
                  'Promo',
                  style: TextStyle(
                    color: value.isInfo ? primaryBase : whiteBase,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget info() {
    return Column(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: primaryLightest,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 74,
                width: 74,
                color: whiteDark,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/homepage/speaker.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'REMINDER!',
                      style: kSubtitle2,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Jangan lupa bayar booking-an kamu ya!',
                      style: kBody2.copyWith(color: blackLightest),
                    ),
                    const SizedBox(
                    height: 12.0,
                    ),
                    Text(
                      '21.18, 12 Des 2022',
                      style: kCaption.copyWith(color: whiteDarkest),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget promo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/homepage/message.png',
          height: 120,
          width: 120,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Tidak ada promo yang tersedia',
          style: kSubtitle1.copyWith(color: blackLight),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'sepertinya tidak ada promosi sekarang',
          style: kBody2.copyWith(color: blackLightest),
        )
      ],
    );
  }
}
