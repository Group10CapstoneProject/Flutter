import 'package:capstone_alterra_flutter/model/members_types_model.dart';
import 'package:capstone_alterra_flutter/model/transaction_model.dart';
import 'package:capstone_alterra_flutter/provider/all_membership_provider.dart';
import 'package:capstone_alterra_flutter/screen/transaction/transaction_detail_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AllMembershipScreen extends StatefulWidget {
  const AllMembershipScreen({super.key});

  @override
  State<AllMembershipScreen> createState() => _AllMembershipScreenState();
}

class _AllMembershipScreenState extends State<AllMembershipScreen> {

  @override
  void initState() {

    AllMembershipProvider provider = Provider.of<AllMembershipProvider>(context, listen: false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async { 
        provider.removeAllMemberType();
        await provider.getAllMemberType();
      }
    );
  }
  
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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                _allMembershipCardWidget(context),
              ],
            ),
          ),
          Consumer<AllMembershipProvider>(
            builder: (context, value, child) {
              return (value.isLoading)? const CircularLoading() : const SizedBox();
            },
          )
        ],
      ),
    );
  }
}









///A widget that contain PageView and its content the membership card
Widget _allMembershipCardWidget(BuildContext context){

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
  Widget membershipCard({required BuildContext context, required MembersTypesModel membersTypesModel}){

    // MembershipClass membershipClass = MembershipClass.fromMembership(membership);

    ///A widget that contain benefit of membership
    Widget textBenefit(String title, bool isTrue){
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Icon(
              (isTrue)? Icons.task_alt : Icons.highlight_off, 
              color: (isTrue)? primaryBase : dangerBase,
            ),
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




    ///A method to display bottomSheet for duration input
    void showDurationBottomSheet(){

      TextEditingController monthTextController = TextEditingController();
      ValueNotifier<String?> errorText = ValueNotifier(null);

      showModalBottomSheet(
        isScrollControlled: true,
        context: context, 
        backgroundColor: Colors.transparent,
        builder: (context) {

          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 325,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jumlah', style: kHeading6.apply(color: blackLight),),
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        }, 
                        icon: const Icon(Icons.close)
                      )
                    ]
                  ),
                  const SizedBox(height: 16,),
                  Text('Berapa bulan?', style: kBody2,),
                  const SizedBox(height: 8,),

                  ///TextField for month input
                  ValueListenableBuilder(
                    valueListenable: errorText,
                    builder: (context, value, child) {
                      return TextField(
                        controller: monthTextController,
                        cursorColor: primaryBase,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => errorText.value = null,
                        decoration: InputDecoration(
                          errorText: errorText.value,
                          hintText: 'Masukkan jumlah angka disini',
                          hintStyle: kBody1.apply(color: whiteDarker),
                          focusColor: primaryBase,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: primaryBase)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: primaryBase)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: dangerDarker)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: dangerDarker)
                          ),
                        ),
                      );
                    }
                  ),
                  const Spacer(),

                  ///ElevatedButton for continue to transaction
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(primaryBase)
                      ),
                      onPressed: (){
                        if(int.tryParse(monthTextController.text) == null){
                          errorText.value = 'Masukkan input bulan dengan benar';
                        }
                        else{
                          errorText.value = null;
                          Navigator.pop(context);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailScreen(
                                transactionModel: TransactionModel.forMembership(
                                  id: membersTypesModel.id.toString(),
                                  title: membersTypesModel.name!,
                                  price: membersTypesModel.price!,
                                  monthQuantity: int.parse(monthTextController.text)
                                ),
                              ),
                            )
                          );
                        }
                      }, 
                      child: Text('LANJUTKAN KE PEMBAYARAN', style: kButton.apply(color: Colors.white),)
                    ),
                  )
                ],
              ),
            ),
          );
        }
      );
    }






    ///return of membershipCard()
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
              color: primaryBase,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10))
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                children: [
                  
                  ///Membership name, coin, and price
                  Image(image: NetworkImage(membersTypesModel.picture!), width: 60, height: 60,),
                  const SizedBox(height: 6,),
                  Text(membersTypesModel.name!, style: kHeading6.apply(color: blackLight),),
                  const SizedBox(height: 16,),
                  Divider(color: whiteDarker,),
                  Padding(
                    padding: const EdgeInsets.all(16), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Utils.currencyFormat(membersTypesModel.price!), 
                          style: kHeading5.copyWith(
                            color: primaryBase, 
                            fontWeight: semiBold
                          ),
                        ),
                        Text('/bulan', style: kHeading6.apply(color: primaryBase))
                      ],
                    ),
                  ),
                  Divider(color: whiteDarker,),
    
                  ///Bunch of textBenefit
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          textBenefit('Dapatkan akses prioritas ketika melakukan booking', true),
                          textBenefit('Akses gym tak terbatas di seluruh klub atlagym', true),
                          textBenefit('Gratis kelas online setiap harinya ', membersTypesModel.accessOnlineClass!),
                          textBenefit('Gratis kelas offline selama berlangganan', membersTypesModel.accessOfflineClass!),
                          textBenefit('Gratis 4 sesi personal training', membersTypesModel.accessTrainer!),
                        ],
                      ),
                    ),
                  ),
    
                  ///Button Buy Now
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        showDurationBottomSheet();
                      }, 
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(Size(double.infinity, 50)),
                        backgroundColor: MaterialStatePropertyAll(primaryBase),
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








  ///return of allMembershipCardWidget
  return SizedBox(
    height: 570,
    width: double.infinity,
    child: Column(
      children: [

        ///PageView
        Expanded(
          child: Consumer<AllMembershipProvider>(
            builder: (context, value, child) => PageView(
              controller: pageController,
              onPageChanged: (value) {
                indexPage.value = value;
              },
              children: [
                // membershipCard(context: context, membership: Membership.bronze),
                // membershipCard(context: context, membership: Membership.silver),
                // membershipCard(context: context, membership: Membership.gold),
                // membershipCard(context: context, membership: Membership.platinum)

                for(MembersTypesModel i in value.listMembers)
                  membershipCard(context: context, membersTypesModel: i),
              ],
            ),
          ),
        ),

        ///Bunch of circleIndicator
        SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
      ],
    ),
  );
}