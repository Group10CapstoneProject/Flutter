import 'package:capstone_alterra_flutter/provider/all_membership_provider.dart';
import 'package:capstone_alterra_flutter/provider/articles_provider.dart';
import 'package:capstone_alterra_flutter/provider/class_provider.dart';
import 'package:capstone_alterra_flutter/provider/code_booking_provider.dart';
import 'package:capstone_alterra_flutter/provider/homepage_provider.dart';
import 'package:capstone_alterra_flutter/provider/main_provider.dart';
import 'package:capstone_alterra_flutter/provider/notification_provider.dart';
import 'package:capstone_alterra_flutter/provider/online_class_provider.dart';
import 'package:capstone_alterra_flutter/provider/payment_confirmation_provider.dart';
import 'package:capstone_alterra_flutter/provider/offline_provider.dart';
import 'package:capstone_alterra_flutter/provider/specified_online_class_provider.dart';
import 'package:capstone_alterra_flutter/provider/trainer_provider.dart';
import 'package:capstone_alterra_flutter/provider/transaction_detail_provider.dart';
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
        ChangeNotifierProvider(create: (context) => TrainerProvider()),
        ChangeNotifierProvider(create: (context) => OfflineProvider()),
        ChangeNotifierProvider(create: (context) => AllMembershipProvider()),
        ChangeNotifierProvider(create: (context) => OnlineClassProvider()),
        ChangeNotifierProvider(create: (context) => TransactionDetailProvider()),
        ChangeNotifierProvider(create: (context) => PaymentConfirmationProvider()),
        ChangeNotifierProvider(create: (context) => SpecifiedOnlineClassProvider()),
        ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
        ChangeNotifierProvider(create: (context) => KodeBookingProvider()),
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