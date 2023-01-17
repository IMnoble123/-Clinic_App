import 'package:at_clinic/features/home/screen/case_screen.dart';
import 'package:at_clinic/features/home/screen/home_page.dart';
import 'package:at_clinic/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
   static const String routeName = "/bottomNavBatScreen";
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currIndex = 0;
  List screens = const [HomeScreen(), SizedBox(), CasesScreen(),ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIndex,
          onTap: (index) {
            setState(() {
              currIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.grey.shade700,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Referrals'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Appointments'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'My Account'),
          ]),
    );
  }
}