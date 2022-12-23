import 'package:flutter/material.dart';

class ImageUrl {
  String masinis = "https://recruitment.kai.id/uploadfoto/content/IMG_3862.JPG";
  String ppka = "https://recruitment.kai.id/uploadfoto/content/IMG_3749.JPG";
  String kondektur =
      "https://recruitment.kai.id/uploadfoto/content/IMG_3169.JPG";
  String teknisiSarana =
      "https://recruitment.kai.id/uploadfoto/content/IMG_3578.JPG";
  String teknisisJalanReldanJembatan =
      "https://recruitment.kai.id/uploadfoto/content/IMG_4555.JPG";
  String pnc = "https://recruitment.kai.id/uploadfoto/content/IMG_4340.JPG";
  String polisiKAI =
      "https://recruitment.kai.id/uploadfoto/content/polsuska.jpg";
  String kpjr = "https://recruitment.kai.id/uploadfoto/content/IMG_4170.JPG";
  String plrorPrs =
      "https://recruitment.kai.id/uploadfoto/content/IMG_2981.JPG";
  String teknisiWorkshop =
      "https://recruitment.kai.id/uploadfoto/content/IMG_4089.JPG";
}

const Color purpleColor = Color(0xff5843BE);
const Color orangeColor = Color(0xffFF9376);
const Color redColor = Color(0xffFF5B5B);
const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor = Color(0xff82868E);
const Color greycardColor = Color(0xffF6F7F8);
const Color greynavColor = Color(0xffF6F7F8);

double edge = 24;
double defaultMargin = 24.0;

TextStyle mediumSize = const TextStyle(fontSize: 16);

/// Get Device with
double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Get Device Height
double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
