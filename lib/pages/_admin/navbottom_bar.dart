import 'package:flutter/material.dart';

import 'applied_page/applied_job_page.dart';
import 'home_page/home_page.dart';
import 'job_page/job_page.dart';
import 'profile_page_admin/profile_page_admin.dart';

class NavBottomBarAdmin extends StatefulWidget {
  const NavBottomBarAdmin({super.key});

  @override
  State<NavBottomBarAdmin> createState() => _NavBottomBarAdminState();
}

class _NavBottomBarAdminState extends State<NavBottomBarAdmin> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const JobPage(),
    const AppliedJobPage(),
    const ProfilePageAdmin()
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
                label: 'List Applied',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]));
  }
}
