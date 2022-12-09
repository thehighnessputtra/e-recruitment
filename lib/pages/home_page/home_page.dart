import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:latihan_firebase/view_model/news_api_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List images = [
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_3862.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_3749.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_3169.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_3578.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_4555.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_4340.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/polsuska.jpg",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_4170.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_2981.JPG",
  //   "https://recruitment.kai.id/uploadfoto/content/IMG_4089.JPG"
  // ];

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  String? name;
  String? email;
  String? role;

  Future getDocID() async {
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'Hi, $name',
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: const Text(
              "Coming soon!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          // ListView.builder(
          //   itemCount: provider.news.length,
          //   itemBuilder: (context, index) {
          //     final data = provider.news[index];
          //     return Text(data.status!);
          //   },
          // )
        ]),
      ),
    );
  }
}
