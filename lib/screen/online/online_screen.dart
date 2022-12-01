import 'package:capstone_alterra_flutter/screen/online/online_filter_screen.dart';
import 'package:capstone_alterra_flutter/screen/online/specified_online_class.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';

class OnlineClass extends StatelessWidget {
  const OnlineClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          onlineFilter(context),
          const SizedBox(height: 8,),
          onlineCard(imgSrc: 'yoga.png', title:  'Yoga', totalVideo: 12, context: context),
          onlineCard(imgSrc: 'strength.png', title: 'Strength', totalVideo: 23, context: context),
          onlineCard(imgSrc: 'cardio.png', title: 'Cardio', totalVideo: 8, context: context),
          onlineCard(imgSrc: 'streching.png', title: 'Streching', totalVideo: 22, context: context),
        ],
      ),
    );
  }



  /// Widget Tombol Filter
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


///Widget card yang menampung jenis online class
  Widget onlineCard({
    required String imgSrc, 
    required String title, 
    required int totalVideo, 
    required BuildContext context
  }){
    return AspectRatio(
      aspectRatio: 328/192,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SpecifiedOnlineClass(title: title,),));
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            image: DecorationImage(image: AssetImage('assets/online_page/$imgSrc'))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(title, style: kHeading6.apply(color: Colors.white),),
              const SizedBox(height: 12,),
              Text('$totalVideo Video', style: kSubtitle1.apply(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}