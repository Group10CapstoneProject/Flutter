import 'package:capstone_alterra_flutter/provider/main_provider.dart';
import 'package:capstone_alterra_flutter/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      ///Body
      body: Consumer<MainProvider>(
        builder: (context, value, child) => value.listPage[value.index],
      ),




      ///BottomNavBar
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, valueProvider, child) => BottomNavigationBar(
          currentIndex: valueProvider.index,
          
          showUnselectedLabels: true,
          unselectedItemColor: whiteDarkest,
          selectedItemColor: primaryDark,
      
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
      
            const BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Trainers'
            ),
      
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/bottom_nav/class.svg', ),
              activeIcon: SvgPicture.asset('assets/bottom_nav/class.svg', color: primaryDark,),
              label: 'Class'
            ),
      
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
            ),
          ],
      
          onTap: (value) {
            valueProvider.setIndex(value);
          },
        ),
      ),
    );
  }
}