import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/provider/main_provider.dart';
import 'package:capstone_alterra_flutter/screen/auth/login_page.dart';
import 'package:capstone_alterra_flutter/screen/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainProvider(),),
      ChangeNotifierProvider(create: (context) => HomepageProvider(),),
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}