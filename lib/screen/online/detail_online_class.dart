import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/screen/transaction/transaction_detail_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailOnlineClass extends StatelessWidget {
  const DetailOnlineClass({
    super.key,
    required this.title,
    required this.minute,
    required this.difficulty,
    required this.price,
    this.image,
  });

  final String title;
  final int minute;
  final String difficulty;
  final int price;
  final String? image;
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.ios_share)
          ),
          const SizedBox(width: 8,),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ///ScrollView
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  ///Image
                  AspectRatio(
                    aspectRatio: 328/160,
                    child: Container(
                      decoration: BoxDecoration(
                        color: primaryBase,
                        image: (image != null) ? 
                          DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/online_page/$image')
                          ) : null
                      ),
                    )
                  ),

                  ///Green Divider
                  Container(
                    height: 8,
                    width: double.infinity,
                    color: primaryBase,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ///Title
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(title, style: kHeading6,)
                        ),
                        const SizedBox(height: 16,),

                        ///Profile picture and Name
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryBase
                              ),
                            ),
                            const SizedBox(width: 12,),
                            Text('Ammy Novarianti', style: kCaption,),
                          ],
                        ),
                        const SizedBox(height: 16,),

                        ///Description
                        Text(
                          'Latihan peregangan dan kekuatan ini akan membantu Anda menghilangkan stres, memperpanjang serat otot Anda dari ujung kepala hingga ujung kaki, dan meningkatkan jangkauan gerak sendi Anda. Itu dikemas dengan peregangan untuk membantu membuka pinggul dan punggung bawah untuk membantu Anda merasa sehat.', 
                          style: kBody2
                        ),
                        const SizedBox(height: 16,),

                        _rowDescription(
                          leading: SvgPicture.asset('assets/online_page/gym.svg',), 
                          title: 'Peralatan', 
                          subTitle: 'Matras'
                        ),

                        _rowDescription(
                          leading: SvgPicture.asset('assets/online_page/target.svg',), 
                          title: 'Target Area', 
                          subTitle: 'Full body'
                        ),

                        _rowDescription(
                          leading: Icon(Icons.alarm_on, color: primaryBase,), 
                          title: 'Durasi', 
                          subTitle: '$minute min'
                        ),

                        _rowDescription(
                          leading: SvgPicture.asset('assets/online_page/fire.svg',), 
                          title: 'Kesulitan', 
                          subTitle: difficulty
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          ///Total Harga & Button Pembayaran
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga', style: kBody1,),
                    Text(Utils.currencyFormat(price), style: kSubtitle1.apply(color: primaryBase),)
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionDetailScreen(
                            transactionModel: TransactionModel.forOnlineClass(
                              id: '1', 
                              title: title, 
                              price: price
                            )
                          ),
                        )
                      );
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(primaryBase),
                      fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 48))
                    ),
                    child: Text('LANJUTKAN KE PEMBAYARAN', style: kButton.apply(color: Colors.white),)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}






Widget _rowDescription({
  required Widget leading,
  required String title,
  required String subTitle,
}){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      border: Border.symmetric(horizontal: BorderSide(color: whiteDark))
    ),
    child: Row(
      children: [

        ///Leading Icon and title
        Expanded(
          child: Row(
            children: [
              leading,
              const SizedBox(width: 8,),
              Text(title, style: kSubtitle2,),
            ],
          ),
        ),

        ///Subtitle
        Expanded(
          child: Text(subTitle, style: kCaption.apply(color: blackLightest),),
        )
      ],
    ),
  );
}