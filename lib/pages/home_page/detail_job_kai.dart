// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class DetailJobKAI extends StatefulWidget {
  final int createAt;
  final String formasi;
  final String jenisKelamin;
  final String jurusan;
  final String ketentuanUmum;
  final String keterangan;
  final String kriteriaUmum;
  final String lokasi;
  final String pendidikan;
  final String prosedurSeleksi;
  final String syaratDokumen;
  final String tahapanSeleksi;
  final String urlPict;
  final String persyaratanUmum;

  DetailJobKAI(
      {required this.createAt,
      required this.formasi,
      required this.jenisKelamin,
      required this.jurusan,
      required this.ketentuanUmum,
      required this.keterangan,
      required this.kriteriaUmum,
      required this.lokasi,
      required this.pendidikan,
      required this.prosedurSeleksi,
      required this.syaratDokumen,
      required this.tahapanSeleksi,
      required this.urlPict,
      required this.persyaratanUmum});

  @override
  State<DetailJobKAI> createState() => _DetailJobKAIState();
}

class _DetailJobKAIState extends State<DetailJobKAI> {
  Color btnColor1 = colorWhiteKAI;
  Color btnColor2 = Colors.transparent;
  Color txtbtnColor1 = colorBlueSecondKAI;
  Color txtbtnColor2 = Colors.grey;
  // PageController _pageController = PageController()
  bool isClick = false;

  bookmarkClick() {
    if (isClick == false) {
      setState(() {
        isClick = true;
      });
    } else {
      setState(() {
        isClick = false;
      });
    }
  }

  btnChangeColor() {
    if (btnColor1 == colorWhiteKAI) {
      setState(() {
        btnColor1 = Colors.transparent;
        btnColor2 = colorWhiteKAI;
        txtbtnColor1 = Colors.grey;
        txtbtnColor2 = Colors.black;
      });
      detailsPage1();
    } else {
      setState(() {
        btnColor1 = colorWhiteKAI;
        btnColor2 = Colors.transparent;
        txtbtnColor1 = Colors.black;
        txtbtnColor2 = Colors.grey;
      });
      detailsPage2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: colorBlueSecondKAI),
            onPressed: () {},
            child: Text(
              "Lamar",
              style: size20.copyWith(color: Colors.white),
            )),
      ),
      appBar: AppBar(
        title: const Text("Job Details"),
        actions: [
          IconButton(
              onPressed: () {
                bookmarkClick();
              },
              icon: Icon(isClick ? Icons.bookmark : Icons.bookmark_border))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CircleAvatar(
                    backgroundColor: colorBlueSecondKAI,
                  )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.formasi,
              textAlign: TextAlign.center,
              style: size20.copyWith(fontWeight: fw700),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey.withOpacity(0.6),
                  size: 16,
                ),
                Text(
                  widget.lokasi,
                  style: size16.copyWith(color: Colors.black.withOpacity(0.4)),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 5),
            //       padding: const EdgeInsets.all(7),
            //       color: Colors.grey.withOpacity(0.2),
            //       child: Text("Full Time", style: size16),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 5),
            //       padding: const EdgeInsets.all(7),
            //       color: Colors.grey.withOpacity(0.2),
            //       child: Text("Designer", style: size16),
            //     ),
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 5),
            //       padding: const EdgeInsets.all(7),
            //       color: Colors.grey.withOpacity(0.2),
            //       child: Text("Onsite", style: size16),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: btnColor1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {
                          btnChangeColor();
                        },
                        child: Text(
                          "Deskripsi",
                          style: size16.copyWith(
                              color: txtbtnColor1, fontWeight: fw600),
                        )),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: btnColor2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7))),
                        onPressed: () {
                          btnChangeColor();
                        },
                        child: Text(
                          "Seleksi",
                          style: size16.copyWith(
                              fontWeight: fw600, color: txtbtnColor2),
                        )),
                  ),
                ],
              ),
            ),
            btnColor1 == Colors.transparent ? detailsPage2() : detailsPage1()
          ],
        ),
      ),
    );
  }

  Widget detailsPage1() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          decoration: BoxDecoration(
            color: colorWhiteKAI,
            border: Border.all(color: colorBlueKAI, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text("Deskripsi Pekerjaan",
                    style: size22.copyWith(
                        fontWeight: fw600, color: colorOrangeSecondKAI)),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text("Lebih banyak"))
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.school,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: size16,
                          widget.pendidikan),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_box,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: size16,
                          widget.jenisKelamin),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_tree_rounded,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: size16,
                          widget.jurusan),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.note_alt,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: size16,
                          widget.keterangan),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.book,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: Text(
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: size16,
                          "Syarat Dokumen..."),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Kriteria",
                style: size20.copyWith(
                    fontWeight: fw600, color: colorBlueSecondKAI)),
            Text(
                textAlign: TextAlign.justify,
                style:
                    size16.copyWith(color: colorOrangeSecondKAI.withOpacity(1)),
                widget.kriteriaUmum),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Ketentuan",
                style: size20.copyWith(
                    fontWeight: fw600, color: colorBlueSecondKAI)),
            Text(
                textAlign: TextAlign.justify,
                style:
                    size16.copyWith(color: colorOrangeSecondKAI.withOpacity(1)),
                widget.ketentuanUmum),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Persyaratan",
                style: size20.copyWith(
                    fontWeight: fw600, color: colorBlueSecondKAI)),
            Text(
              widget.persyaratanUmum,
              textAlign: TextAlign.justify,
              style:
                  size16.copyWith(color: colorOrangeSecondKAI.withOpacity(1)),
            ),
          ]),
        ),
      ],
    );
  }

  Widget detailsPage2() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
          decoration: BoxDecoration(
            color: colorWhiteKAI,
            border: Border.all(color: colorBlueKAI, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Tahap Seleksi",
                style: size22.copyWith(
                    fontWeight: fw700, color: colorOrangeSecondKAI)),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                textAlign: TextAlign.justify,
                style: size16,
                widget.tahapanSeleksi),
          ]),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Prosedur Seleksi",
                style: size20.copyWith(
                    fontWeight: fw600, color: colorBlueSecondKAI)),
            Text(
                textAlign: TextAlign.justify,
                style:
                    size16.copyWith(color: colorOrangeSecondKAI.withOpacity(1)),
                widget.prosedurSeleksi),
          ]),
        ),
      ],
    );
  }
}
