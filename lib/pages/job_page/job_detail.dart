import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/style/theme.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';

class JobDetailUser extends StatefulWidget {
  String tipePekerjaan;
  String namaPerusahaan;
  String namaLoker;
  String lokasi;
  String gaji;
  String urlLogo;
  String deskripsiPerusahaan;
  String deskripsiKualifikasi;
  String deskripsiKeahlian;

  JobDetailUser(
      {super.key,
      required this.tipePekerjaan,
      required this.namaPerusahaan,
      required this.namaLoker,
      required this.lokasi,
      required this.gaji,
      required this.urlLogo,
      required this.deskripsiPerusahaan,
      required this.deskripsiKualifikasi,
      required this.deskripsiKeahlian});

  @override
  State<JobDetailUser> createState() => _JobDetailUserState();
}

class _JobDetailUserState extends State<JobDetailUser> {
  String? name;
  String? email;
  String? role;
  String? cvName;
  String? cvURL;
  String? about;
  String? avatarUrl;
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
          cvName = snapshot.data()!['cvName'];
          cvURL = snapshot.data()!['cvURL'];
          about = snapshot.data()!['about'];
          avatarUrl = snapshot.data()!['avatarUrl'];
        });
      }
    });
  }

  validasiCV() {
    Future.delayed(Duration(seconds: 1), () {
      if (cvName == "Masukan CV anda!") {
        dialogWarning(context,
            "Anda belum melampirkan file CV anda! silahkan anda melampirkan CV anda pada halaman profile");
      }
    });
  }

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.urlLogo,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),

            ListView(
              children: [
                const SizedBox(
                  height: 328.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.namaLoker,
                              style: mediumSize.copyWith(
                                fontSize: 22,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'RP ${widget.gaji}',
                                style: mediumSize.copyWith(
                                  fontSize: 16,
                                  color: Colors.blue,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  widget.lokasi,
                                  style: mediumSize.copyWith(
                                    fontSize: 20,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Deskripsi Kualifikasi',
                          style: mediumSize.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.deskripsiKualifikasi,
                          style: mediumSize.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Deskripsi Keahlian',
                          style: mediumSize.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.deskripsiKeahlian,
                          style: mediumSize.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          onPressed: () {
                            if (cvName == "Masukan CV anda!") {
                              validasiCV();
                            } else {
                              dialogValidasi(
                                context,
                                "Apakah kamu yakin?",
                                () {
                                  FirebaseFirestore.instance
                                      .runTransaction((transaction) async {
                                    CollectionReference reference =
                                        FirebaseFirestore.instance
                                            .collection("listapply");
                                    await reference
                                        .doc(email! + widget.namaLoker)
                                        .set({
                                      "namaLoker": widget.namaLoker,
                                      "namaPerusahaan": widget.namaPerusahaan,
                                      "gaji": widget.gaji,
                                      "namaPelamar": name,
                                      "cvName": cvName,
                                      "cvURL": cvURL,
                                      "email": email,
                                      "about": about,
                                      "avatarUrl": avatarUrl,
                                      "status": "Menunggu",
                                    });
                                    Navigator.pop(context);
                                    dialogInfo(context, "Success Apply Job!");
                                    futureDelayNavBack(context, 3);
                                  });
                                },
                              );
                            }
                          },
                          child: Text(
                            'Apply Vacancy',
                            style: mediumSize.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            // todo : button back dan favorite
          ],
        ),
      ),
    );
  }
}
