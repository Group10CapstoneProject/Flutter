import 'package:capstone_alterra_flutter/model/members_detail_model.dart';
import 'package:capstone_alterra_flutter/screen/membership/all_membership_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/membership.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMembershipScreen extends StatelessWidget {
  const MyMembershipScreen({super.key, required this.membersDetailModel});

  final MembersDetailModel membersDetailModel;

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
            _myMembershipWidget(context, membersDetailModel),
            _yourMemberBenefitsWidget(Membership.platinum),
          ],
        ),
      ),
    );
  }
}










///A widget that contain membership info of user
Widget _myMembershipWidget(BuildContext context, MembersDetailModel membersDetailModel){

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        const SizedBox(height: 6,),
        Text('Hai, ${UserToken.userProfileModel!.name}', style: kBody1,),
        const SizedBox(height: 16,),
        Text('Kamu adalah member ${membersDetailModel.memberType!.name} Altagym', style: kSubtitle1,),
        const SizedBox(height: 12,),

        ///Membership Card contain membership type, member since date, expiry date
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryBase,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image(image: AssetImage('assets/membership_page/rangoli.png'), height: 150,)
                )
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        (membersDetailModel.memberType!.picture != null) ? 
                          Image(image: NetworkImage(membersDetailModel.memberType!.picture!), height: 45, width: 45,) : 
                          const SizedBox(),
                        const SizedBox(width: 8,),
                        Text('Member ${membersDetailModel.memberType!.name}', style: kSubtitle1.apply(color: Colors.white),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Text('Anggota Sejak', style: kBody2.apply(color: Colors.white),),
                    const SizedBox(height: 6,),
                    Text(Utils.dateTimeFormat2(DateTime.parse(membersDetailModel.activedAt!)), style: kSubtitle2.copyWith(color: Colors.white, fontWeight: semiBold),),
                    const SizedBox(height: 20,),
                    Text('Berlaku Hingga', style: kBody2.apply(color: Colors.white),),
                    const SizedBox(height: 6,),
                    Text(Utils.dateTimeFormat2(DateTime.parse(membersDetailModel.expiredAt!)), style: kSubtitle2.copyWith(color: Colors.white, fontWeight: semiBold),),
                  ],
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AllMembershipScreen(),));
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Lihat semua member', style: kBody2.apply(color: primaryBase),),
                const SizedBox(width: 4,),
                Icon(Icons.navigate_next, color: primaryBase,)
              ],
            ),
          ),
        )
      ],
    ),
  );
}











///A widget that contain all benefit of user membership
Widget _yourMemberBenefitsWidget(Membership membership){

  MembershipClass membershipClass = MembershipClass.fromMembership(membership);

  ///A widget that show a card of a benefit of user membership
  Widget benefitCard(String title){
    return Container(
      height: 72,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 6,
            offset: Offset(1, 2)
          )
        ]
      ),
      child: Row(
        children: [
          Icon(Icons.task_alt, color: primaryBase, size: 20,),
          const SizedBox(width: 12,),
          Expanded(
            child: Text(title, style: kBody2.apply(color: blackLightest),)
          )
        ],
      ),
    );
  }




  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.symmetric(vertical: 32),
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: whiteDarker)
      )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Keuntungan Member-mu', style: kHeading6,),
        const SizedBox(height: 16,),
        for(String i in membershipClass.benefit)
          benefitCard(i)
      ],
    ),
  );







}