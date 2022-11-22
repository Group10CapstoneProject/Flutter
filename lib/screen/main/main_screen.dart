import 'package:capstone_alterra_flutter/provider/main_provider.dart';
import 'package:capstone_alterra_flutter/styles/my_color.dart';
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
      
      ///AppBar
      appBar: AppBar(
        backgroundColor: MyColor.primaryColor.shade500,
        elevation: 0,
        titleSpacing: 8,
        title: Container(
          padding: const EdgeInsets.all(8),
          height: kToolbarHeight,
          width: double.infinity,
          child: Row(
            children: const[
              Image(image: AssetImage('assets/homepage/Altagym.png'),),
              SizedBox(width: 4,),
              Expanded(child: Text('AltaGym', style: TextStyle(fontWeight: FontWeight.w500),))
            ]
          ),
        ),
        
        actions: [

          ///Notification Button
          TextButton(
            onPressed: (){}, 
            child: const Icon(Icons.notifications, color: Colors.white)
          ),
        ],
      ),





      ///Body
      body: Consumer<MainProvider>(
        builder: (context, value, child) => value.listPage[value.index],
      ),




      ///BottomNavBar
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, valueProvider, child) => BottomNavigationBar(
          currentIndex: valueProvider.index,
          
          showUnselectedLabels: true,
          unselectedItemColor: MyColor.whiteColor.shade700,
          selectedItemColor: MyColor.primaryColor.shade600,
      
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
              activeIcon: SvgPicture.asset('assets/bottom_nav/class.svg', color: MyColor.primaryColor.shade600,),
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