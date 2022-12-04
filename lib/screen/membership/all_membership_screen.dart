import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/membership.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllMembershipScreen extends StatelessWidget {
  const AllMembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Membership', style: kHeading6.apply(color: blackLight),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0, left: 32.0, right: 32.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Temukan Keanggotaan Yang Cocok Untukmu!', style: kSubtitle1.apply(color: primaryBase), textAlign: TextAlign.left),
                  const SizedBox(height: 16,),
                  Text('Pilih paket membership yang kamu inginkan.', style: kBody2.apply(color: blackLightest), textAlign: TextAlign.left,),
                ],
              ),
            ),
            _allMembershipCard(),
          ],
        ),
      ),
    );
  }
}









///A widget that contain PageView and its content the membership card
Widget _allMembershipCard(){

  ValueNotifier<int> indexPage = ValueNotifier(0);

  PageController pageController = PageController();

  ///A widget that shaped as a circle that indicate the shown page of pageView
  Widget circleIndicator(bool isActive){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: (isActive)? primaryBase : const Color(0xFFD9D9D9),
        shape: BoxShape.circle
      ),
    );
  }


  ///A widget that categorized as card that contain membership info such as name, price and benefits
  Widget membershipCard(Membership membership){

    MembershipClass membershipClass = MembershipClass.fromMembership(membership);

    Widget textBenefit(String title){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(Icons.task_alt, color: primaryBase,),
            const SizedBox(width: 8,),
            Expanded(
              child: Text(
                title,
                style: kCaption.apply(color: blackLightest),
              ),
            )
          ],
        ),
      );
    }





    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: whiteDarker, strokeAlign: StrokeAlign.outside)
      ),
      child: Column(
        children: [
          Container(
            height: 15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: membershipClass.color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10))
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/membership_page/${membershipClass.coinFile}'), width: 60, height: 60,),
                  Text(membershipClass.name, style: kHeading6.apply(color: blackLight),),
                  const SizedBox(height: 16,),
                  Divider(color: whiteDarker,),
                  Padding(
                    padding: const EdgeInsets.all(16), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          membershipClass.priceFormatted, 
                          style: kHeading5.copyWith(
                            color: membershipClass.color, 
                            fontWeight: semiBold
                          ),
                        ),
                        Text('/bulan', style: kHeading6.apply(color: membershipClass.color))
                      ],
                    ),
                  ),
                  Divider(color: whiteDarker,),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          for(String i in membershipClass.benefit)
                            textBenefit(i)
                        ],
                      ),
                    ),
                  ),

                  ///Button Buy Now
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
                        backgroundColor: MaterialStatePropertyAll(membershipClass.color),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                      ),
                      child: Text('BELI SEKARANG', style: kButton.apply(color: Colors.white),)
                    ),
                  )
                    
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }







  return SizedBox(
    height: 550,
    width: double.infinity,
    child: Column(
      children: [

        ///PageView
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              indexPage.value = value;
            },
            children: [
              membershipCard(Membership.bronze),
              membershipCard(Membership.silver),
              membershipCard(Membership.gold),
              membershipCard(Membership.platinum)
            ],
          ),
        ),

        ///Bunch of circleIndicator
        SizedBox(
          height: 40,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for(int i = 0; i < 4; i++)
                ValueListenableBuilder(
                  valueListenable: indexPage,
                  builder: (context, value, child) {
                    return circleIndicator((value == i ? true : false));
                  }
                )
            ],
          ),
        )
      ],
    ),
  );
}