// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class ToeflPage extends StatefulWidget {
  final String namaFormasi;
  final String pendidikan;
  final String email;
  const ToeflPage(
      {super.key,
      required this.namaFormasi,
      required this.pendidikan,
      required this.email});

  @override
  State<ToeflPage> createState() => _ToeflPageState();
}

PilihanGanda? pg;

enum PilihanGanda { A, B, C, D }

class _ToeflPageState extends State<ToeflPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  int hasil = 0;
  @override
  Widget build(BuildContext context) {
    int soal = 1 + currentIndex;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: currentIndex == 20
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorOrangeSecondKAI),
                      onPressed: () {
                        CollectionReference ref = FirebaseFirestore.instance
                            .collection('listApplyKAI');
                        ref
                            .doc(widget.namaFormasi +
                                widget.pendidikan +
                                widget.email)
                            .update({'nilaiToefl': hasil});
                        navBackTransition(context);
                        navBackTransition(context);
                      },
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (currentIndex == 0 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 1 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 2 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 3 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 4 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 5 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 6 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 7 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 8 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 9 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 10 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 11 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 12 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 13 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 14 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 15 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 16 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 17 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 18 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        } else if (currentIndex == 19 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                            print("PG $hasil");
                          });
                        }
                        carouselController.nextPage();
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
                currentIndex == 20 ? "TOEFL - RESULT" : "TOEFL No. $soal")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CarouselSlider(
            items: [
              // 1
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Mark Twain ______ the years after the Civil War the 'Gilded Age'"),
                optionA: Text("called"),
                optionB: Text("calling"),
                optionC: Text("he called"),
                optionD: Text("his calls"),
              ),
              // 2
              const TOEFLSoalWidget(
                soalPG:
                    Text("Early ______ toes insted of hooves on their feet"),
                optionA: Text("horses"),
                optionB: Text("horses had"),
                optionC: Text("had horses"),
                optionD: Text("horses having"),
              ),
              // 3
              const TOEFLSoalWidget(
                soalPG: Text(
                    "______ grow close to the ground in the short Arctic summer."),
                optionA: Text("Above tundra plants"),
                optionB: Text("Tundra plants are found"),
                optionC: Text("Tundra plants"),
                optionD: Text("For tundra plants"),
              ),
              // 4
              const TOEFLSoalWidget(
                soalPG: Text(
                    "In 1867 ______ Alaska from the Russian for \$7.2 millon"),
                optionA: Text("purchased the United States"),
                optionB: Text("to purchase the United States"),
                optionC: Text("the United States' purchase of"),
                optionD: Text("the United States purchased"),
              ),
              // 5
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Between 1725 and 1750, New England witnessed an increase in the specialization of ______"),
                optionA: Text("occupations"),
                optionB: Text("occupies"),
                optionC: Text("they occupied"),
                optionD: Text("it occupied them"),
              ),
              // 6
              const TOEFLSoalWidget(
                soalPG: Text(
                    "The large carotid artery ______ to the main parts of the brain"),
                optionA: Text("carrying blood"),
                optionB: Text("carries blood"),
                optionC: Text("blood in carried"),
                optionD: Text("blood carried"),
              ),
              // 7
              const TOEFLSoalWidget(
                soalPG: Text(
                    "______ radio as the first practical system of wireless telegraphy"),
                optionA: Text("Marconi's development"),
                optionB: Text("The development by Marconi"),
                optionC: Text("Marconi developed"),
                optionD: Text("Developing Marconi"),
              ),
              // 8
              const TOEFLSoalWidget(
                soalPG: Text(
                    "in 1975 the first successful space probe to ______ begining to send information back to Earth"),
                optionA: Text("Venus"),
                optionB: Text("Venus the"),
                optionC: Text("Venus it was"),
                optionD: Text("Venus was"),
              ),
              // 9
              const TOEFLSoalWidget(
                soalPG: Text(
                    "The two biggest resort ______ Arkansas are Hot Spring and Eureka Springs"),
                optionA: Text("towns in"),
                optionB: Text("in"),
                optionC: Text("towns are"),
                optionD: Text("towns are in"),
              ),
              // 10
              const TOEFLSoalWidget(
                soalPG: Text(
                    "NASA's Lyndon B. Johnson Space Center ______ control center for the Mercury Gemini and Apollo space flights"),
                optionA: Text("it was the"),
                optionB: Text("was the"),
                optionC: Text("it was at the"),
                optionD: Text("the"),
              ),
              // 11
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Only when air and water seep throught its outer coat ______"),
                optionA: Text("to the germination of a seed"),
                optionB: Text("a seed germinates"),
                optionC: Text("does a seed germinate"),
                optionD: Text("for a seed to germinate"),
              ),
              // 12
              const TOEFLSoalWidget(
                soalPG: Text(
                    "_______ seasonal rainfall, especially in regions near the tropics, is winds that blow in an opposite direction in winter than in summer"),
                optionA: Text("Causing"),
                optionB: Text("That cause"),
                optionC: Text("To cause"),
                optionD: Text("What causes"),
              ),
              // 13
              const TOEFLSoalWidget(
                soalPG: Text(
                    "The flight instructor _______ at the air base, said that orders not to fight had been given"),
                optionA: Text("what interviewed"),
                optionB: Text("when he nterviewed"),
                optionC: Text("when his interview"),
                optionD: Text("when interviewing"),
              ),
              // 14
              const TOEFLSoalWidget(
                soalPG: Text(
                    "In the northern and central parts of the state of Idaho ______ and churning rivers"),
                optionA: Text("majestic mountains are found"),
                optionB: Text("found majestic mountains"),
                optionC: Text("the United States' purchase of"),
                optionD: Text("finding majestic mountains"),
              ),
              // 15
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Most species of heliotropes are weeds, ______ of them are cultivated"),
                optionA: Text("some"),
                optionB: Text("for some species"),
                optionC: Text("but some"),
                optionD: Text("some species"),
              ),
              // 16
              const TOEFLSoalWidget(
                soalPG: Text(
                    "The horn of the rhinoceros consists of a cone of tight bundles of keratin ______ from the epidermis"),
                optionA: Text("grow"),
                optionB: Text("grows"),
                optionC: Text("they grow"),
                optionD: Text("growing"),
              ),
              // 17
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Thunder occours as _______ throught air, causing the heated air to expand and collide with layers of cooler air"),
                optionA: Text("an electrical charge passes"),
                optionB: Text("an electrical charge"),
                optionC: Text("the passing of an electrical charge"),
                optionD: Text("passes an electrical charge"),
              ),
              // 18
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Researchers have long debated _______ Saturn's moon Titan contains hydrocarbon oceans and lakes"),
                optionA: Text("over it"),
                optionB: Text("whether"),
                optionC: Text("whether it"),
                optionD: Text("whether over"),
              ),
              // 19
              const TOEFLSoalWidget(
                soalPG: Text(
                    "Nimbostratus clouds are thick, dark grey clouds ______ forebode rain"),
                optionA: Text("what"),
                optionB: Text("what they"),
                optionC: Text("which"),
                optionD: Text("which they"),
              ),
              // 20
              const TOEFLSoalWidget(
                soalPG: Text(
                    "_______ of precious gems is determined by their hardness, color and brilliance"),
                optionA: Text("The valuable"),
                optionB: Text("It is the value"),
                optionC: Text("It is valuable"),
                optionD: Text("The value"),
              ),
              Text("SCORE : $hasil")
            ],
            options: CarouselOptions(
              height: double.maxFinite,
              viewportFraction: 1,
              animateToClosest: false,
              disableCenter: true,
              scrollPhysics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: carouselController,
          ),
        ),
      ),
    );
  }
}

class TOEFLSoalWidget extends StatefulWidget {
  const TOEFLSoalWidget({
    super.key,
    required this.soalPG,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
  });

  final Widget soalPG;
  final Widget optionA;
  final Widget optionB;
  final Widget optionC;
  final Widget optionD;

  @override
  State<TOEFLSoalWidget> createState() => _TOEFLSoalWidgetState();
}

class _TOEFLSoalWidgetState extends State<TOEFLSoalWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.soalPG,
          RadioListTile<PilihanGanda>(
              value: PilihanGanda.A,
              title: Row(
                children: [const Text("A. "), widget.optionA],
              ),
              groupValue: pg,
              onChanged: (value) {
                setState(() {
                  pg = value;
                });
              }),
          RadioListTile<PilihanGanda>(
              value: PilihanGanda.B,
              title: Row(
                children: [
                  const Text("B. "),
                  widget.optionB,
                ],
              ),
              groupValue: pg,
              onChanged: (value) {
                setState(() {
                  pg = value;
                });
              }),
          RadioListTile<PilihanGanda>(
              value: PilihanGanda.C,
              title: Row(
                children: [const Text("C. "), widget.optionC],
              ),
              groupValue: pg,
              onChanged: (value) {
                setState(() {
                  pg = value;
                });
              }),
          RadioListTile<PilihanGanda>(
              value: PilihanGanda.D,
              title: Row(
                children: [const Text("D. "), widget.optionD],
              ),
              groupValue: pg,
              onChanged: (value) {
                setState(() {
                  pg = value;
                });
              }),

          // ElevatedButton(
          //     onPressed: () {
          //       if (pg == PilihanGanda.A) {
          //         // setState(() {
          //         //   widget.hasil = widget.hasil + 5;
          //         // });
          //       } else {
          //         // setState(() {
          //         //   widget.hasil = widget.hasil + 0;
          //         // });
          //       }
          //       // print(widget.hasil);
          //     },
          //     child: const Text("Submit"))
        ],
      ),
    );
  }
}
