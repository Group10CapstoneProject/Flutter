import 'dart:async';

import 'package:capstone_alterra_flutter/model/auth_model.dart';
import 'package:capstone_alterra_flutter/screen/landing_page/landing_page_screen.dart';
import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:capstone_alterra_flutter/service/auth_service.dart';
import 'package:capstone_alterra_flutter/util/user_token.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? timer;
  bool isRefreshProcessDone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{

      Widget? nextPage;
      timer = Timer(const Duration(milliseconds: 1500), () {
        if(isRefreshProcessDone){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage!,));
        }
      },);

      String? refreshToken = await UserToken.getRefreshToken();

      if(refreshToken == null){
        nextPage = const LandingPageScreen();
      }
      else{
        AuthService authService = AuthService();
        AuthModel model = await authService.postGenerateNewToken(refreshToken: refreshToken);
        if(model.statusCode == 200){
          UserToken.accessToken = model.accessToken;
          UserToken.setRefreshToken(model.refreshToken!);
          nextPage = const MainScreen();
        }
        else{
          nextPage = const LandingPageScreen();
        }
      }
      isRefreshProcessDone = true;
      if(!(timer!.isActive)){
        if(mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextPage!,));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(image: AssetImage('assets/logo.png'), width: 152,),
      )
    );
  }
}