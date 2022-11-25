import 'package:capstone_alterra_flutter/screen/auth/login_page.dart';
import 'package:flutter/material.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: const [
                      Image(image: AssetImage('assets/landing_page/LandingPageImg.png')),
                      SizedBox(height: 1,)
                    ],
                  ),
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
                    Text(
                      'Selamat Datang di Altagym', 
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      'Ayo mulai hidup sehat bersama Altagym karena sehat itu mahal', 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.25
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Material(
                  color: const Color(0xFF52A1A4),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        )
                      );
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'MULAI', 
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}