import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetDocByid extends StatefulWidget {
  const GetDocByid({super.key});

  @override
  State<GetDocByid> createState() => _GetDocByidState();
}

class _GetDocByidState extends State<GetDocByid> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  String? name;
  String? email;
  String? role;

  getDocID() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['name'];
          email = snapshot.data()!['email'];
          role = snapshot.data()!['role'];
        });
      }
    });
  }
}
