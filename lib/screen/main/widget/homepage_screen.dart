import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/screen/notifikasi/notifikasi.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
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
              _artikel(),
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
  Widget dummy = Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
    child: AspectRatio(
      aspectRatio: 305 / 149,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage('assets/homepage/Rectangle 12.png'),
                fit: BoxFit.cover)),
      ),
    ),
  );

  List<Widget> listdummy = [for (int i = 0; i < 7; i++) dummy];

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
  Widget dummy = Container(
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              color: Colors.green,
              image: DecorationImage(
                  image: AssetImage('assets/homepage/Kelas hari ini.png'),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(255, 69, 106, 134), BlendMode.multiply),
                  fit: BoxFit.cover),
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
                              '17:00',
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
                          '10 Slot Tersisa',
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
                        'Zumba',
                        style: kHeading6.apply(color: Colors.white),
                      ),
                      Text('With Randy',
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

  List<Widget> listItemKelas = [for (int i = 0; i < 7; i++) dummy];

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 16,
              ),
              ...listItemKelas,
            ],
          ),
        ),
      )
    ],
  );
}

///Artikel
///Bagian artikel yang diletakan pada bagian bawah homepage screen
///Bagian yang menunjukkan dari teks 'Artikel' hingga kumpulan list artikel
Widget _artikel() {
  ///Widget atau Container yang menampung data item list dari artikel
  Widget dummy = Container(
    height: 106,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration:
        BoxDecoration(border: Border(bottom: BorderSide(color: whiteDark))),
    child: Row(
      children: [
        ///Article image
        ///Menampung gambar artikel
        Container(
          width: 92,
          height: 82,
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: AssetImage('assets/homepage/Rectangle 153.png'),
                  fit: BoxFit.cover)),
        ),

        ///Menampung title list artikel dan tanggal artikel
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Panduan Lengkap Memilih Alat Olahraga di Rumah',
              style: kSubtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text('Nov 10, 2022',
                style: kCaption.apply(
                  color: whiteDarkest,
                )),
          ],
        ))
      ],
    ),
  );

  List<Widget> listDummy = [for (int i = 0; i < 7; i++) dummy];

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
            Text(
              'Lihat Semua',
              style: kCaption.apply(color: primaryBase),
            )
          ],
        ),

        Column(children: listDummy)
      ],
    ),
  );
}
