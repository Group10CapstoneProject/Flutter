import 'package:capstone_alterra_flutter/model/articles_model.dart';
import 'package:capstone_alterra_flutter/model/offline_model.dart';
import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/screen/articles/articles_list_screen.dart';
import 'package:capstone_alterra_flutter/screen/notifikasi/notifikasi.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:capstone_alterra_flutter/util/utils.dart';
import 'package:capstone_alterra_flutter/widget/article_listitem.dart';
import 'package:capstone_alterra_flutter/widget/circular_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {

  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomepageProvider provider = Provider.of<HomepageProvider>(context, listen: false);
      provider.getAllArticles();
      provider.getOfflineClass();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///AppBar
        appBar: AppBar(
          backgroundColor: primaryBase,
          elevation: 0,
          titleSpacing: 8,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: primaryBase),
          title: Container(
            padding: const EdgeInsets.all(8),
            height: kToolbarHeight,
            width: double.infinity,
            child: Row(children: const [
              Image(
                image: AssetImage('assets/homepage/Altagym.png'),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                  child: Text(
                'AltaGym',
                style: TextStyle(fontWeight: FontWeight.w500),
              ))
            ]),
          ),
          actions: [
            ///Notification Button
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                child: const Icon(Icons.notifications, color: Colors.white)),
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
                        color: primaryBase,
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(10))),
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
                            'Selamat Pagi ${UserToken.userProfileModel?.name}',
                            style: kSubtitle1.apply(color: Colors.white),
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

              const SizedBox(
                height: 16,
              ),

              ///Kelas hari ini
              _kelasHariIni(),

              const SizedBox(
                height: 16,
              ),

              ///Artikel
              Consumer<HomepageProvider>(
                builder: (context, value, child) {
                  return _artikel(context, value.listArticle);
                }
              ),
            ],
          ),
        ));
  }
}

///Promo Iklan
///Container yang ditempatkan pada bagian atas Homepage
Widget _promoIklan(BuildContext context) {
  HomepageProvider provider =
      Provider.of<HomepageProvider>(context, listen: false);
  PageController pageController = PageController();

  ///Iklan Container
  ///Sebuah Container yang menampung data dummy yang akan dipajang
  Widget card(String img) {
    return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
    child: AspectRatio(
      aspectRatio: 305 / 149,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage('assets/homepage/$img'),
                fit: BoxFit.cover)),
        ),
      ),
    );
  }

  List<Widget> listdummy = [
    card('Rectangle 12.png'),
    card('iklan2.jpg'),
    card('iklan3.jpg'),
    card('iklan4.jpg'),
    card('iklan5.jpg'),
  ];

  ///Coursel
  ///Widget berbentuk titik sebagai indicator iklan yang ditunjukkan
  Widget coursel(bool active) => Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (active) ? primaryBase : whiteDarker,
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
      )),
      Container(
        height: 15,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Row(
          children: [
            for (int i = 0; i < listdummy.length; i++)
              Consumer<HomepageProvider>(
                builder: (context, value, child) =>
                    coursel((i == value.iklanIndex) ? true : false),
              )
          ],
        ),
      )
    ],
  );
}

///Kelas hari ini
///Bagian homepage yang menunjukkan dari text 'Kelas hari ini' hingga kumpulan Container yang menampung data kelas hari ini
///Bagian ini diletakkan pada bagian tengah homepage screen
Widget _kelasHariIni() {

  ///Widget atau Container yang menampung data item list Kelas hari ini
  Widget cardTodaysClass(OfflineModel offlineModel){
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ///Header & Body
          ///Menampung Heder & Body (Tidak termasuk status(text 'Pesan Kelas'))
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                color: Colors.green,
                image: (offlineModel.picture != null)
                    ? DecorationImage(
                        image: NetworkImage(offlineModel.picture!),
                        colorFilter: const ColorFilter.mode(
                            Color.fromARGB(255, 69, 106, 134), BlendMode.multiply),
                        fit: BoxFit.cover)
                    : null,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///Header
                  ///Menampung waktu dan slot tersisa
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.dark_mode,
                                size: 16,
                              ),
                              Text(
                                Utils.dateTimeFormat4(offlineModel.time),
                                style: kCaption,
                              )
                            ],
                          ),
                        ),

                        const SizedBox(
                          width: 8,
                        ),

                        ///Slot remaining
                        Expanded(
                          child: Text(
                            '${(offlineModel.slot! - offlineModel.slotBooked!.toInt())} Slot Tersisa',
                            style: kCaption.apply(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Body
                  ///Menampung gambar dan judul dan trainer
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
                            const Icon(
                              Icons.fitness_center,
                              size: 13.2,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Sedang',
                              style: kCaption.apply(color: Colors.white),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        ///Judul
                        Text(
                          offlineModel.title.toString(),
                          style: kHeading6.apply(color: Colors.white),
                        ),
                        Text('With ${offlineModel.trainerName}',
                            style: kSubtitle1.apply(color: Colors.white)),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),

          ///Status
          ///Menampung teks 'Pesan kelas'
          Container(
            height: 47,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(10)),
                color: primaryBase),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pesan Kelas',
                  style: kSubtitle1.apply(color: Colors.white),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 18,
                  width: 18,
                  padding: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right,
                    color: primaryBase,
                    size: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
                child: Text(
              'Kelas hari ini',
              style: kHeading6,
            )),
            Row(
              children: [
                Text(
                  'Lihat semua',
                  style: kBody2,
                ),
                Icon(
                  Icons.chevron_right,
                  color: primaryBase,
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      Center(
        child: SizedBox(
          height: 200,
          width: double.infinity,
          child: Consumer<HomepageProvider>(
            builder: (context, value, child) => (!value.offlineIsLoading) 
                ? ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    for(OfflineModel i in value.listOffline)
                        cardTodaysClass(i)
                  ],
                ) : const CircularLoading(backgroundColor: Colors.transparent,),
          ),
        ),
      )
    ],
  );
}

///Artikel
///Bagian artikel yang diletakan pada bagian bawah homepage screen
///Bagian yang menunjukkan dari teks 'Artikel' hingga kumpulan list artikel
Widget _artikel(BuildContext context, List<ArticlesModel> list) {
  ///Widget atau Container yang menampung data item list dari artikel
  // Widget dummy(ArticlesModel articlesModel){
  //   return ArticleListitem(articlesModel: articlesModel);
  // }

  ///Contain list of widget of articleListitem
  ///Limited to maximum 4
  int maxLimit = (list.length > 4) ? 4 : list.length;
  List<Widget> listArticle = [
    for (int i = 0; i < maxLimit; i++) 
      ArticleListitem(articlesModel: list[i])
  ];

  return Container(
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Title & subtitle
        Text(
          'Artikel',
          style: kHeading6,
        ),

        const SizedBox(
          height: 8,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Temukan tips sehatmu',
                style: kBody2.apply(color: blackLight),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ArticlesListScreen(listArticle: list),));
              },
              child: Text(
                'Lihat Semua',
                style: kCaption.apply(color: primaryBase),
              ),
            )
          ],
        ),

        ///Kumpulan data Article
        Consumer<HomepageProvider>(
          builder: (context, value, child) => (!value.articleIsLoading)
            ? Column(
              children: listArticle
            ) 
            : const SizedBox(
              height: 100,
              child: CircularLoading(backgroundColor: Colors.transparent,)
            ),
        )
      ],
    ),
  );
}
