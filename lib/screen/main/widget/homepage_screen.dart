import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/styles/my_color.dart';
import 'package:capstone_alterra_flutter/styles/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///AppBar
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor.shade500,
        elevation: 0,
        titleSpacing: 8,
        title: Container(
          padding: const EdgeInsets.all(8),
          height: kToolbarHeight,
          width: double.infinity,
          child: Row(
            children: const[
              Image(image: AssetImage('assets/homepage/Altagym.png'),),
              SizedBox(width: 4,),
              Expanded(child: Text('AltaGym', style: TextStyle(fontWeight: FontWeight.w500),))
            ]
          ),
        ),
        
        actions: [

          ///Notification Button
          TextButton(
            onPressed: (){}, 
            child: const Icon(Icons.notifications, color: Colors.white)
          ),
        ],
      ),

      ///Body
      body: SingleChildScrollView(
        child: Column(
          children: [

            ///Konten 1
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor.shade500,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10))
                  ),
                ),

                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///Selamat Pagi [USER]
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Selamat Pagi Jake!', 
                          style: MyTextStyle.textStyle.subtitle1?.apply(color: Colors.white),
                        ),
                      ),


                      ///Promo - Iklan
                      Expanded(
                        child: _promoIklan(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16,),

            ///Kelas hari ini
            _kelasHariIni(),

            const SizedBox(height: 16,),

            ///Artikel
            _artikel(),

          ],
        ),
      )
    );
  }
}














///Promo Iklan
Widget _promoIklan(BuildContext context){

    HomepageProvider provider = Provider.of<HomepageProvider>(context, listen: false);
    PageController pageController = PageController();



    ///Iklan Container
    Widget dummy = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: AspectRatio(
        aspectRatio: 305/149,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(image: AssetImage('assets/homepage/Rectangle 12.png'), fit: BoxFit.cover)
          ),
        ),
      ),
    );

    List<Widget> listdummy = [
      for(int i = 0; i<7; i++)
        dummy
    ];



    ///Coursel
    Widget coursel(bool active) => Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (active)? MyColor.primaryColor.shade500 : MyColor.whiteColor.shade400,
      ),
    );






    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) {
              provider.changeIklan(value.toDouble());
            },
            children: listdummy,
          )
        ),


        Container(
          height: 15,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Row(
            children: [
              for(int i = 0; i<listdummy.length; i++)
                Consumer<HomepageProvider>(
                  builder: (context, value, child) => coursel((i == value.iklanIndex)? true : false),
                )
              
            ],
          ),
        )
      ],
    );
  }



















///Kelas hari ini
Widget _kelasHariIni(){


  Widget dummy = Container(
    width: 150,
    margin: const EdgeInsets.only(right: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      children: [
        
        ///Header & Body
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.green,
              image: DecorationImage(
                image: AssetImage('assets/homepage/Kelas hari ini.png'), 
                colorFilter: ColorFilter.mode(Color.fromARGB(255, 69, 106, 134), BlendMode.multiply),
                fit: BoxFit.cover
              ),

            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                ///Header
                Container(
                  height: 38,
                  padding: const EdgeInsets.only(top: 1, left: 6, right: 6),
                  child: Row(
                    children: [
                      
                      ///Time
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 60,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(13))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.dark_mode, size: 16,),
                            Text('17:00', style: MyTextStyle.textStyle.caption,)
                          ],
                        ),
                      ),

                      const SizedBox(width: 8,),


                      ///Slot remaining
                      Expanded(
                        child: Text('10 Slot Tersisa', style: MyTextStyle.textStyle.caption!.apply(color: Colors.white), textAlign: TextAlign.center,),
                      )

                    ],
                  ),
                ),


                ///Body
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        ///Tingkatan
                        Row(
                          children: [
                            const Icon(Icons.fitness_center, size: 13.2, color: Colors.white,),
                            const SizedBox(width: 16,),
                            Text('Sedang', style: MyTextStyle.textStyle.caption!.apply(color: Colors.white),),
                          ],
                        ),

                        const SizedBox(height: 8,),

                        ///Judul
                        Text('Zumba', style: MyTextStyle.textStyle.headline6!.apply(color: Colors.white),),
                        Text('With Randy', style: MyTextStyle.textStyle.subtitle1!.apply(color: Colors.white)),
                      ],
                    ),
                  )
                )


              ],
            ),
          ),
        ),

        ///Status
        Container(
          height: 47,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
            color: MyColor.primaryColor.shade500
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Pesan Kelas', style: MyTextStyle.textStyle.subtitle1!.apply(color: Colors.white),),
              const SizedBox(width: 8,),
              Container(
                height: 18,
                width: 18,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.chevron_right, color: MyColor.primaryColor.shade500, size: 18,),
              ),
            ],
          ),
        )
      ],
    ),
  );



  List<Widget> listItemKelas = [
    for(int i = 0; i < 7; i++)
      dummy
  ];


  return Column(
    children: [

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: Text('Kelas hari ini', style: MyTextStyle.textStyle.headline6,)),
      
            Row(
              children: [
                Text('Lihat semua', style: MyTextStyle.textStyle.bodyText2,),
                Icon(Icons.chevron_right, color: MyColor.primaryColor.shade500,)
              ],
            )
          ],
        ),
      ),

      const SizedBox(height: 24,),

      Center(
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16,),
              ...listItemKelas,
              
            ],
          ),
        ),
      )
    ],
  );
}

















///Artikel
Widget _artikel (){

  Widget dummy = Container(
    height: 106,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: MyColor.whiteColor.shade200))
    ),
    child: Row(
      children: [

        ///Article image
        Container(
          width: 92,
          height: 82,
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(image: AssetImage('assets/homepage/Rectangle 153.png'), fit: BoxFit.cover)
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Panduan Lengkap Memilih Alat Olahraga di Rumah', 
                style: MyTextStyle.textStyle.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),

              Text(
                'Nov 10, 2022', 
                style: MyTextStyle.textStyle.caption!.apply(color: MyColor.whiteColor.shade700,)
              ),
            ],
          )
        )
      ],
    ),
  );


  List<Widget> listDummy = [
    for(int i = 0; i < 7; i++)
      dummy
  ];



  return Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        ///Title & subtitle
        Text('Artikel', style: MyTextStyle.textStyle.headline6,),

        const SizedBox(height: 8,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Temukan tips sehatmu', 
                style: MyTextStyle.textStyle.bodyText2!.apply(color: MyColor.blackColor.shade200),
              ),
            ),

            Text('Lihat Semua', style: MyTextStyle.textStyle.caption!.apply(color: MyColor.primaryColor.shade500),)
          ],
        ),




        Column(
          children: listDummy
        )
        
      ],
    ),
  );
}