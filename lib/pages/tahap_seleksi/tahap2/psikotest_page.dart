// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class PsikotestPage extends StatefulWidget {
  final String namaFormasi;
  final String pendidikan;
  final String email;
  const PsikotestPage(
      {super.key,
      required this.namaFormasi,
      required this.pendidikan,
      required this.email});

  @override
  State<PsikotestPage> createState() => _PsikotestPageState();
}

PilihanGanda? pg;

enum PilihanGanda { A, B, C, D, E }

class _PsikotestPageState extends State<PsikotestPage> {
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
                            .update({'nilaiPsikotest': hasil});
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
                        } else if (currentIndex == 4 && pg == PilihanGanda.E) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 5 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 6 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 7 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 8 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 9 && pg == PilihanGanda.E) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 10 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 11 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 12 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 13 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 14 && pg == PilihanGanda.E) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 15 && pg == PilihanGanda.A) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 16 && pg == PilihanGanda.B) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 17 && pg == PilihanGanda.C) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 18 && pg == PilihanGanda.D) {
                          setState(() {
                            hasil = hasil + 5;
                          });
                        } else if (currentIndex == 19 && pg == PilihanGanda.E) {
                          setState(() {
                            hasil = hasil + 5;
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
            title: Text(currentIndex == 20
                ? "Psikotest - Hasil"
                : "Psikotest No. $soal")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CarouselSlider(
            items: [
              // 1
              const PsikotestSoalWidget(
                  soalPG: Text(
                      "Kegiatan untuk membangun 1 unit rumah dibutuhkan waktu selama 36 hari dengan bantuan 12 tenaga kerja. Berapa waktu yang dihabiskan untuk membangun rumah dengan tenaga kerja 24 orang?"),
                  optionA: Text("18 Hari"),
                  optionB: Text("15 Hari"),
                  optionC: Text("14 Hari"),
                  optionD: Text("16 Hari"),
                  optionE: Text("12 Hari")),
              // 2
              const PsikotestSoalWidget(
                  soalPG: Text(
                      "Perbandingan uang Chaca dan Citra yaitu 3:2. Jika uang Chaca dan Citra berjumlah Rp 150.000, berapa masing-masing uang yang dimiliki oleh Chaca dan Citra?"),
                  optionA: Text("Rp 80.000 dan Rp 60.000"),
                  optionB: Text("Rp 90.000 dan Rp 60.000"),
                  optionC: Text("Rp 90.000 dan Rp 70.000"),
                  optionD: Text("Rp 100.000 dan Rp 80.000"),
                  optionE: Text("Rp 100.000 dan Rp 90.000")),
              // 3
              const PsikotestSoalWidget(
                  soalPG: Text("2,8,14,20,…….,32"),
                  optionA: Text("28"),
                  optionB: Text("25"),
                  optionC: Text("26"),
                  optionD: Text("30"),
                  optionE: Text("35")),
              // 4
              const PsikotestSoalWidget(
                  soalPG: Text("365, 363, 359,…….,…….., 335, 323"),
                  optionA: Text("353 dan 340"),
                  optionB: Text("348 dan 345"),
                  optionC: Text("355 dan 350"),
                  optionD: Text("353 dan 345"),
                  optionE: Text("355 dan 344")),
              // 5
              const PsikotestSoalWidget(
                  soalPG: Text("A,B,C,P,G,H,I,Q,…..,…..,…….,….."),
                  optionA: Text("N, O, P"),
                  optionB: Text("R, S, T"),
                  optionC: Text("J, K, L"),
                  optionD: Text("R, S, T"),
                  optionE: Text("M, N, O")),
              // 6
              PsikotestSoalWidget(
                  soalPG: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_soal.png?alt=media&token=e2b5587f-80eb-4664-b5c2-8b75b41a7a09"),
                  optionA: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_a.png?alt=media&token=2bafe57a-6e2c-4fff-b319-f8709fcc82fe"),
                  optionB: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_b.png?alt=media&token=cefda5d1-610f-4988-9d96-c552fcfcbc74"),
                  optionC: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_c.png?alt=media&token=6ecf2389-00e6-4fa4-b529-9f02ad3fdb04"),
                  optionD: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_d.png?alt=media&token=d9bcd8a5-cf08-4213-9dcf-0a3e4919a646"),
                  optionE: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F6_e.png?alt=media&token=e2c360d9-bcff-4b80-baac-528d0b264055")),
              PsikotestSoalWidget(
                  soalPG: Column(children: [
                    const Text(
                        "Jika serpihan di bawah ini dirangkai, maka akan membentuk..."),
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2F7_soal.png?alt=media&token=57ad678a-f37c-461f-a242-a4f7a70d6a0a")
                  ]),
                  optionA: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%207%2F7_a.png?alt=media&token=e9e3fbdf-9c65-4c43-92a2-ffea7a850816"),
                  optionB: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%207%2F7_b.png?alt=media&token=e9e3fbdf-9c65-4c43-92a2-ffea7a850816"),
                  optionC: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%207%2F7_c.png?alt=media&token=e9e3fbdf-9c65-4c43-92a2-ffea7a850816"),
                  optionD: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%207%2F7_d.png?alt=media&token=e9e3fbdf-9c65-4c43-92a2-ffea7a850816"),
                  optionE: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%207%2F7_e.png?alt=media&token=e9e3fbdf-9c65-4c43-92a2-ffea7a850816")),
              PsikotestSoalWidget(
                  soalPG: Column(children: [
                    const Text("Mana yang sesuai dengan kubus di bawah?"),
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_soal.png?alt=media&token=640017d2-2f94-4d94-aa0b-53107bb32ecf")
                  ]),
                  optionA: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_a.png?alt=media&token=a5d81a78-590f-4777-af5e-10bc1af1a05d"),
                  optionB: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_b.png?alt=media&token=a5d81a78-590f-4777-af5e-10bc1af1a05d"),
                  optionC: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_c.png?alt=media&token=a5d81a78-590f-4777-af5e-10bc1af1a05d"),
                  optionD: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_d.png?alt=media&token=a5d81a78-590f-4777-af5e-10bc1af1a05d"),
                  optionE: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%208%2F8_e.png?alt=media&token=a5d81a78-590f-4777-af5e-10bc1af1a05d")),
              PsikotestSoalWidget(
                  soalPG: Column(children: [
                    const Text("Mana yang sesuai dengan prisma di bawah?"),
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_soal.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973")
                  ]),
                  optionA: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_a.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973"),
                  optionB: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_b.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973"),
                  optionC: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_c.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973"),
                  optionD: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_d.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973"),
                  optionE: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%209%2F9_e.png?alt=media&token=aa4f8a38-1954-48ee-9601-2b0f76e75973")),
              PsikotestSoalWidget(
                  soalPG: Column(children: [
                    const Text("Mana yang sesuai dengan kubus di bawah?"),
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_soal.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10")
                  ]),
                  optionA: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_a.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10"),
                  optionB: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_b.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10"),
                  optionC: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_c.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10"),
                  optionD: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_d.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10"),
                  optionE: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/myStorage%2Fsoal%2010%2F10_e.png?alt=media&token=4c7fd261-3fb3-4dc2-aeaf-c3729580ec10")),
              const PsikotestSoalWidget(
                  soalPG: Text(
                      "Siswa kelas 4 baru saja akan naik kelas 5, jika memang sudah lulus ujian perkalian. Nina dan Budi adalah murid kelas 5. Kesimpulan yang paling tepat untuk pertanyaan tersebut yaitu?"),
                  optionA: Expanded(
                    child: Text(
                        "Budi dan Nina pasti mampu menghadapi ujian perkalian"),
                  ),
                  optionB: Expanded(
                      child:
                          Text("Budi tidak lulus mengikuti ujian perkalian")),
                  optionC:
                      Expanded(child: Text("Budi lebih pandai daripada Nina")),
                  optionD: Expanded(
                    child: Text(
                        "Budi dan Nina belum tentu mampu mengerjakan ujian perkalian"),
                  ),
                  optionE: Expanded(
                    child: Text(
                        "Nina ternyata tidak lulus mengikuti ujian perkalian"),
                  )),
              const PsikotestSoalWidget(
                  soalPG: Text(
                      "Setiap tanaman memiliki buah. Sebagian tanaman ada yang berbunga merah. Kesimpulan yang tepat dari soal dibawah ini yaitu."),
                  optionA: Expanded(
                    child: Text(
                        "Setiap tanaman memiliki buah yang berbunga merah"),
                  ),
                  optionB: Expanded(
                    child: Text(
                        "Sebagian tanaman memiliki buah, bunganya bukan merah"),
                  ),
                  optionC: Expanded(
                    child: Text(
                        "Semua tanaman tidak memiliki buah, bunganya tidak merah"),
                  ),
                  optionD: Expanded(
                    child: Text(
                        "Semua tanaman tentu saja memiliki buah, bunganya tidak merah"),
                  ),
                  optionE: Expanded(
                    child: Text(
                        "Sebagian tanaman tidak memiliki buah dan bunganya warna merah"),
                  )),
              const PsikotestSoalWidget(
                  soalPG: Text(
                      "Saat nanti Budi berhasil lulus kuliah kurang dari atau sama dengan 4 tahun, maka Budi akan langsung diterima sebagai karyawan perusahaan A. Jika Budi berhasil bekerja di perusahaan A, maka ayahnya akan membelikannya mobil. Budi tidak mendapatkan mobil dari ayahnya. "),
                  optionA: Expanded(
                    child: Text(
                        "Budi berhasil selesai studi tepat selama 4 tahun"),
                  ),
                  optionB: Expanded(child: Text("Budi kerja naik mobil")),
                  optionC: Expanded(
                    child:
                        Text("Budi berhasil selesai studi lebih dari 4 tahun"),
                  ),
                  optionD:
                      Expanded(child: Text("Budi bekerja di perusahaan A")),
                  optionE: Expanded(
                      child: Text("Budi selesai studi kurang dari 4 tahun"))),
              const PsikotestSoalWidget(
                  soalPG: Text("Motor – Bensin = Pelari – …….."),
                  optionA: Text("Sepatu"),
                  optionB: Text("Kaos"),
                  optionC: Text("Lintasan"),
                  optionD: Text("Makanan"),
                  optionE: Text("Minuman")),
              const PsikotestSoalWidget(
                  soalPG: Text("Tulang- Patah = Perut – ……."),
                  optionA: Text("Batuk"),
                  optionB: Text("Kaos"),
                  optionC: Text("Pilek"),
                  optionD: Text("Gemuk"),
                  optionE: Text("Mules")),
              const PsikotestSoalWidget(
                  soalPG: Text("Kupu-Kupu – Terbang = Jalan – ……."),
                  optionA: Text("Jauh"),
                  optionB: Text("Singa"),
                  optionC: Text("Lebah"),
                  optionD: Text("Ayam"),
                  optionE: Text("Minuman")),
              const PsikotestSoalWidget(
                  soalPG: Text("Minyak – Supermarket = Pakaian – ….."),
                  optionA: Text("Laundry"),
                  optionB: Text("Butik"),
                  optionC: Text("Rok"),
                  optionD: Text("Celana"),
                  optionE: Text("Kemeja")),
              const PsikotestSoalWidget(
                  soalPG: Text("Kain Sutera – Ulat = Madu – ……."),
                  optionA: Text("Manis"),
                  optionB: Text("Asin"),
                  optionC: Text("Lebah"),
                  optionD: Text("Bunga"),
                  optionE: Text("Segar")),
              const PsikotestSoalWidget(
                  soalPG: Text("Apel –Buah = Sapi – ……"),
                  optionA: Text("Kebau"),
                  optionB: Text("Gemuk`"),
                  optionC: Text("Tumbuhan"),
                  optionD: Text("Binatang"),
                  optionE: Text("Kambing")),
              const PsikotestSoalWidget(
                  soalPG: Text("Papan Tulis – Spidol = Dinding – ….."),
                  optionA: Text("Meja"),
                  optionB: Text("Kayu`"),
                  optionC: Text("Pulpen"),
                  optionD: Text("Amplas"),
                  optionE: Text("Kuas")),
              Text("Nilai : $hasil")
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

class PsikotestSoalWidget extends StatefulWidget {
  const PsikotestSoalWidget({
    super.key,
    required this.soalPG,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.optionE,
  });

  final Widget soalPG;
  final Widget optionA;
  final Widget optionB;
  final Widget optionC;
  final Widget optionD;
  final Widget optionE;

  @override
  State<PsikotestSoalWidget> createState() => _PsikotestSoalWidgetState();
}

class _PsikotestSoalWidgetState extends State<PsikotestSoalWidget> {
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
          RadioListTile<PilihanGanda>(
              value: PilihanGanda.E,
              title: Row(
                children: [const Text("E. "), widget.optionE],
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
