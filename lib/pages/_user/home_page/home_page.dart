import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int activeIndex = 0;

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

  List images = [
    "assets/images/slider1_masisnis.jpeg",
    "assets/images/slider2_ppka.jpeg",
    "assets/images/slider3_kondektur.jpeg",
    "assets/images/slider4_teknisisarana.jpeg",
    "assets/images/slider5_teknisijalanrel.jpeg",
    "assets/images/slider6_pnc.jpeg",
    "assets/images/slider7_polisika.jpg",
    "assets/images/slider8_plr.jpeg",
    "assets/images/slider9_teknisiworkshop.jpeg",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Hi, ${FirebaseAuth.instance.currentUser!.email}',
            style: const TextStyle(color: Colors.blueGrey),
          )),
      body: Column(children: [
        CarouselSlider.builder(
          itemCount: images.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            autoPlayAnimationDuration: Duration(seconds: 7),
          ),
          itemBuilder: (context, index, realIdx) {
            return Center(
                child:
                    Image.asset(images[index], fit: BoxFit.cover, width: 1000));
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "Coming soon!",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ]),
    );
  }
}
