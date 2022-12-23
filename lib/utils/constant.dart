import 'package:flutter/material.dart';

const Color purpleColor = Color(0xff5843BE);
const Color orangeColor = Color(0xffFF9376);
const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor = Color(0xff82868E);
const Color greycardColor = Color(0xffF6F7F8);
const Color greynavColor = Color(0xffF6F7F8);
const Color lightBlueColor = Color(0xffe7f5ff);
const Color blueColor = Color(0xff8febfa);

class HexColor extends Color {
  static int hexColors(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(hexColors(hexColor));
}

Color colorWhiteKAI = HexColor("ffffff");
Color colorWhiteSecondKAI = HexColor("f6f6f6");
Color colorOrangeKAI = HexColor("f08200");
Color colorOrangeSecondKAI = HexColor("f36925");
Color colorBlueKAI = HexColor("0b56a7");
Color colorBlueSecondKAI = HexColor("2e2b72");
Color colorRed = HexColor("FF5B5B");

double clip12 = 12;
double clip16 = 16;
double clip20 = 20;
double clip24 = 24;
double clip28 = 28;
double clip32 = 32;
double clip36 = 36;
double clip40 = 40;

TextStyle size12 = const TextStyle(fontSize: 12);
TextStyle size14 = const TextStyle(fontSize: 14);
TextStyle size16 = const TextStyle(fontSize: 16);
TextStyle size18 = const TextStyle(fontSize: 18);
TextStyle size20 = const TextStyle(fontSize: 20);
TextStyle size22 = const TextStyle(fontSize: 22);
TextStyle size24 = const TextStyle(fontSize: 24);
TextStyle size26 = const TextStyle(fontSize: 26);
TextStyle size28 = const TextStyle(fontSize: 28);
TextStyle size30 = const TextStyle(fontSize: 30);

FontWeight fw300 = FontWeight.w300;
FontWeight fw400 = FontWeight.w400;
FontWeight fw500 = FontWeight.w500;
FontWeight fw600 = FontWeight.w600;
FontWeight fw700 = FontWeight.w700;
FontWeight fw800 = FontWeight.w800;
FontWeight fw900 = FontWeight.w900;
