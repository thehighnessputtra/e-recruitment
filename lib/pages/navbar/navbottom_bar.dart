import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/applied_page/applied_job_kai.dart';
import 'package:latihan_firebase/pages/home_page/home_page.dart';
import 'package:latihan_firebase/pages/job_page/job_page_kai.dart';
import 'package:latihan_firebase/pages/profile_page/profile_page.dart';
import 'package:latihan_firebase/utils/constant.dart';

class NavBottomBarUser extends StatefulWidget {
  const NavBottomBarUser({super.key});
  @override
  State<NavBottomBarUser> createState() => _NavBottomBarUserState();
}

class _NavBottomBarUserState extends State<NavBottomBarUser> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const JobPageKAI(),
    const AppliedJobKAI(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: colorBlueSecondKAI,
            selectedItemColor: colorOrangeKAI,
            unselectedItemColor: colorWhiteKAI,
            iconSize: 25,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'Daftar Loker',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'Status Lamaran',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]));
  }
}
