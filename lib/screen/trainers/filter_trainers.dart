import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainerFilterScreen extends StatelessWidget {
  const TrainerFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: whiteColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: blackLight,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Filter',
            style: kHeading6.copyWith(color: blackLight),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  'HAPUS SEMUA',
                  style: kButton.copyWith(color: dangerDarker),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: whiteColor,
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _harga(),
                      _jadwal(),
                      _aktivitas(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 85,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Color(0xFF52A1A4)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ))),
                child: Text(
                  'TERAPKAN FILTER',
                  style: kButton.copyWith(color: whiteBase),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _harga() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Harga',
            style: kSubtitle1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Wrap(
            spacing: 12,
            children: [
              _chip(isChoosen: true, title: 'Semua', onTap: () {}),
              _chip(isChoosen: false, title: 'Rendah - Tinggi', onTap: () {}),
              _chip(isChoosen: false, title: 'Tinggi - Rendah', onTap: () {}),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    ),
  );
}

Widget _jadwal() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: whiteDarker,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Gender',
            style: kSubtitle1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Wrap(
            spacing: 12,
            children: [
              _chip(isChoosen: true, title: 'Semua', onTap: () {}),
              _chip(isChoosen: false, title: 'Wanita', onTap: () {}),
              _chip(isChoosen: false, title: 'Pria', onTap: () {}),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    ),
  );
}

Widget _aktivitas() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: whiteDarker,
            thickness: 1,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Pelatih',
              style: kSubtitle1,
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: TextField(
            cursorColor: primaryDarker,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F4F3),
              labelText: 'Cari nama pelatih',
              labelStyle: kBody2.copyWith(color: blackLightest),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: blackLight,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: whiteDarker,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: primaryDarker,
                  )),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _chip(
    {required bool isChoosen,
    required String title,
    required void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Chip(
      label: Text(
        title,
        style: kBody2.copyWith(color: (isChoosen) ? whiteColor : blackLight),
      ),
      backgroundColor: (isChoosen) ? primaryBase : whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primaryBase),
      ),
    ),
  );
}
