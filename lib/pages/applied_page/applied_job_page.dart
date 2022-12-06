import 'package:flutter/material.dart';

class AppliedJobPage extends StatefulWidget {
  const AppliedJobPage({super.key});

  @override
  State<AppliedJobPage> createState() => _AppliedJobPageState();
}

class _AppliedJobPageState extends State<AppliedJobPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Cooming soon!",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
