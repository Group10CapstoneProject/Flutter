import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyMembershipScreen extends StatelessWidget {
  const MyMembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SizedBox(),
    );
  }
}