import 'package:capstone_alterra_flutter/screen/online/detail_online_class.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecifiedOnlineClass extends StatelessWidget {
  const SpecifiedOnlineClass({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(title, style: kHeading6,),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8,),
            _classCard(
              title: 'Yoga for Core Strength', 
              minute: 30, 
              difficulty: 'Mudah', 
              price: 30000,
              context: context,
              image: 'yoga_1.jpeg'
            ),
            _classCard(
              title: 'Yoga for Endurance Training', 
              minute: 45, 
              difficulty: 'Sedang', 
              price: 50000,
              context: context,
              image: 'yoga_2.png'
            ),
            _classCard(
              title: 'Relaxing Yoga Flow', 
              minute: 28, 
              difficulty: 'Sulit', 
              price: 32000,
              context: context,
              image: 'yoga_3.jpeg'
            ),
          ],
        ),
      ),
    );
  }
}







///Card yang menampung item kelas
Widget _classCard({
  required String title,
  required int minute,
  required String difficulty,
  required int price,
  required BuildContext context,
  String? image,
}){
  return AspectRatio(
    aspectRatio: 328/237,
    child: GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetailOnlineClass(
              title: title,
              minute: minute,
              difficulty: difficulty,
              price: price,
              image: image,
            )
          )
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 12,
              color: Color(0x1A000000),
              offset: Offset(2, 4)
            )
          ],
          color: primaryBase,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [

            ///Image
            AspectRatio(
              aspectRatio: 328/160,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/online_page/$image'),
                    fit: BoxFit.cover
                  ),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                ),
              ),
            ),

            ///Green Divider
            Container(
              height: 8,
              width: double.infinity,
              color: primaryBase,
            ),

            ///Title, Price, Minute, Difficulty
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title, 
                            style: kSubtitle1,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ),
                        const SizedBox(width: 48,),
                        Text(Utils.currencyFormat(price), style: kSubtitle1.apply(color: primaryBase),),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.alarm_on, color: primaryBase,),
                            const SizedBox(width: 4,),
                            Text('$minute min', style: kBody2.apply(color: blackLightest),)
                          ],
                        ),
                        const SizedBox(width: 16,),
                        Row(
                          children: [
                            SvgPicture.asset('assets/online_page/fire.svg', color: primaryBase,),
                            const SizedBox(width: 4,),
                            Text(difficulty, style: kBody2.apply(color: blackLightest),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    ),
  );
}