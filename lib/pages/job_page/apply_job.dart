import 'package:flutter/material.dart';

class ApplyJob extends StatefulWidget {
  const ApplyJob({super.key});

  @override
  State<ApplyJob> createState() => _ApplyJobState();
}

class _ApplyJobState extends State<ApplyJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Vacancy"),
      ),
      body: SingleChildScrollView(),
    );
  }
}
