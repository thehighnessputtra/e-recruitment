import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/applied_page/applied_job_page.dart';
import 'package:latihan_firebase/pages/home_page/home_page.dart';
import 'package:latihan_firebase/pages/job_page/job_page.dart';
import 'package:latihan_firebase/pages/profile_page/profile_page.dart';

class NavBottomBarUser extends StatefulWidget {
  const NavBottomBarUser({super.key});

  @override
  State<NavBottomBarUser> createState() => _NavBottomBarUserState();
}

class _NavBottomBarUserState extends State<NavBottomBarUser> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const JobPage(),
    const AppliedJobPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blueGrey[800],
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.white,
            iconSize: 25,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.work),
                label: 'Job vacancies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'Job Applied',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]));
  }
}
