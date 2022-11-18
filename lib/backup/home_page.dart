import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //     title: const Text(
      //       "Jobfinders",
      //       style: TextStyle(color: Colors.blue),
      //     ),
      //     elevation: 0,
      //     backgroundColor: Colors.transparent),
      body: Center(
        child: Text(
          "Coming soon!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
