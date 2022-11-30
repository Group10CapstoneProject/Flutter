import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnlineFilterScreen extends StatelessWidget {
  const OnlineFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: (){}, 
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('HAPUS SEMUA', style: kButton.apply(color: dangerDarker),),
              )
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _harga(),
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
                onPressed: (){
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(primaryBase),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    )
                  )
                ),
                child: Text('TERAPKAN FILTER', style: kButton.apply(color: Colors.white),)
              ),
            )
          ],
        ),
      ),
    );
  }
}













Widget _harga(){
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16), 
          child: Text('Harga', style: kSubtitle1,)
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Wrap(
            spacing: 12,
            children: [
              _chip(isChoosen: false, title: 'Semua', onTap: (){}),
              _chip(isChoosen: true, title: 'Rendah - Tinggi', onTap: (){}),
              _chip(isChoosen: false, title: 'Tinggi - Rendah', onTap: (){}),
              _chip(isChoosen: false, title: 'Tinggi - Rendah', onTap: (){}),
            ],
          ),
        ),
        const SizedBox(height: 4,),
      ],
    ),
  );
}











Widget _aktivitas(){
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: whiteDarker,
            height: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16), 
          child: Text('Aktivitas', style: kSubtitle1,)
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: TextField(
            cursorColor: primaryDarker,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF2F4F3),
              labelText: 'Cari aktivitas',
              labelStyle: kBody2.apply(color: primaryBase),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixIcon: TextButton(
                onPressed: (){},
                child: Icon(Icons.search, color: blackLight,),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: whiteDarker,
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: primaryDarker,
                )
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Wrap(
            spacing: 12,
            children: [
              _chip(isChoosen: true, title: 'Semua', onTap: (){}),
              _chip(isChoosen: false, title: 'Boxing', onTap: (){}),
              _chip(isChoosen: false, title: 'Dance', onTap: (){}),
              _chip(isChoosen: false, title: 'Fitness', onTap: (){}),
              _chip(isChoosen: false, title: 'Fit Rush', onTap: (){}),
              _chip(isChoosen: false, title: 'HIIT', onTap: (){}),
              _chip(isChoosen: false, title: 'Meditation', onTap: (){}),
              _chip(isChoosen: false, title: 'Muay Thai', onTap: (){}),
              _chip(isChoosen: false, title: 'Pilates', onTap: (){}),
              _chip(isChoosen: false, title: 'Pound Fit', onTap: (){}),
              _chip(isChoosen: false, title: 'Strenght & Endurance', onTap: (){}),
              _chip(isChoosen: false, title: 'Strong Nation', onTap: (){}),
              _chip(isChoosen: false, title: 'Virtual Training', onTap: (){}),
              _chip(isChoosen: false, title: 'Workout', onTap: (){}),
              _chip(isChoosen: false, title: 'Yoga', onTap: (){}),
              _chip(isChoosen: false, title: 'Zumba', onTap: (){}),
            ],
          ),
        ),
        const SizedBox(height: 4,),
      ],
    ),
  );
}







Widget _chip({required bool isChoosen, required String title, required void Function()? onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Chip(
      label: Text(title, style: kBody2.apply(color: (isChoosen)? Colors.white : blackLight),),
      backgroundColor: (isChoosen)? primaryBase : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: primaryBase
        )
      ),
    ),
  );
}