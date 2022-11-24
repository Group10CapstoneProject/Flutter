import 'package:flutter/material.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const Image(image: AssetImage('assets/landing_page/LandingPageImg.png')),
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (p0context, p1constraint) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: p1constraint.maxHeight * 35 / 100,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(0, 255, 255, 255),
                                  Colors.white
                                ]
                              )
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: const [
                    Text('Selamat Datang di Altagym'),
                    SizedBox(height: 8,),
                    Text(
                      'Ayo mulai hidup sehat bersama Altagym karena sehat itu mahal', 
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64,),
              Container(
                height: 48,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF52A1A4),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Text('MULAI', style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}