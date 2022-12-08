import 'package:capstone_alterra_flutter/provider/class_provider.dart';
import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/provider/main_provider.dart';
import 'package:capstone_alterra_flutter/screen/splash/splash_screen.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async{

  initializeDateFormatting('id_ID', null).then((value) {

    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => HomepageProvider(),),
        ChangeNotifierProvider(create: (context) => ClassProvider()),
      ],
      child: const MyApp()
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 

    ///Disable landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        }
      ),
      theme: ThemeData(

        ///for scroll color
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryLight),
        
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}