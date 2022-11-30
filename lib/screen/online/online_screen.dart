import 'package:capstone_alterra_flutter/screen/online/online_filter_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';

class OnlineClass extends StatelessWidget {
  const OnlineClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F4F3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            onlineFilter(context),
            const SizedBox(height: 8,),
            onlineCard('yoga.png', 'Yoga'),
            onlineCard('strength.png', 'Strength'),
            onlineCard('cardio.png', 'Cardio'),
            onlineCard('streching.png', 'Streching'),
          ],
        ),
      ),
    );
  }



  // Kumpulan Filter
  Widget onlineFilter(BuildContext context) {
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OnlineFilterScreen(),));
              },
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



  Widget onlineCard(String imgSrc, String title){
    return AspectRatio(
      aspectRatio: 328/192,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage('assets/online_page/$imgSrc'))
        ),
        child: Text(title, style: kHeading6.apply(color: Colors.white),),
      ),
    );
  }
}