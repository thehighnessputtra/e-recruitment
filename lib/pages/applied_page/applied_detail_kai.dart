// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppliedDetailKAI extends StatefulWidget {
  final String biografiPelamar;
  final String avatarUrlPelamar;
  final String cvNamePelamar;
  final String cvURLPelamar;
  final String emailPelamar;
  final String lokasiPelamar;
  final String namaFormasiPelamar;
  final String namaPelamar;
  final String statusPelamar;
  final String pendidikan;
  const AppliedDetailKAI(
      {super.key,
      required this.biografiPelamar,
      required this.avatarUrlPelamar,
      required this.cvNamePelamar,
      required this.cvURLPelamar,
      required this.emailPelamar,
      required this.lokasiPelamar,
      required this.namaFormasiPelamar,
      required this.namaPelamar,
      required this.statusPelamar,
      required this.pendidikan});

  @override
  State<AppliedDetailKAI> createState() => _AppliedDetailKAIState();
}

class _AppliedDetailKAIState extends State<AppliedDetailKAI> {
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

  @override
  void initState() {
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Data Pelamar"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    ClipOval(
                        child: Material(
                            child: Ink.image(
                      image: NetworkImage(widget.avatarUrlPelamar),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                        "${widget.namaFormasiPelamar} (${widget.pendidikan})",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: widget.statusPelamar == "DITERIMA"
                              ? Colors.green
                              : widget.statusPelamar == "DITOLAK"
                                  ? Colors.red
                                  : widget.statusPelamar == "Menunggu"
                                      ? colorOrangeSecondKAI
                                      : Colors.blue),
                      padding: const EdgeInsets.all(5),
                      child: Text(widget.statusPelamar,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Nama", style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.namaPelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Email", style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.emailPelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Curriculum Vitae",
                          style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.cvNamePelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Identitas KTP",
                          style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.cvNamePelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Ijazah", style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.cvNamePelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Sertifikat TOEFL",
                          style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.cvNamePelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text("Transkrip Nilai",
                          style: TextStyle(fontSize: 16))),
                  const Text(" : ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    flex: 4,
                    child: Text(widget.biografiPelamar,
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              adminController()
            ],
          ),
        ));
  }

  adminController() {
    // if (user!.email == "prayogidwicahyoputra@gmail.com") {
    if (role == "Admin") {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    CollectionReference ref =
                        FirebaseFirestore.instance.collection('listApplyKAI');
                    ref
                        .doc(widget.namaFormasiPelamar +
                            widget.pendidikan +
                            widget.emailPelamar)
                        .update({
                      'status': "DITERIMA",
                    });
                    dialogInfo(
                        context,
                        "${widget.namaPelamar}-${widget.namaFormasiPelamar} DITERIMA!",
                        1);
                    futureDelayNavBack(context, 1);
                  },
                  child: const Text("Terima")),
              ElevatedButton(
                  onPressed: () {
                    CollectionReference ref =
                        FirebaseFirestore.instance.collection('listApplyKAI');
                    ref
                        .doc(widget.namaFormasiPelamar +
                            widget.pendidikan +
                            widget.emailPelamar)
                        .update({
                      'status': "DITOLAK",
                    });
                    dialogInfo(
                        context,
                        "${widget.namaPelamar}-${widget.namaFormasiPelamar} DITOLAK!",
                        1);
                    futureDelayNavBack(context, 1);
                  },
                  child: const Text("Tolak")),
              ElevatedButton(
                  onPressed: () async {
                    if (widget.emailPelamar != null) {
                      if (widget.statusPelamar == "DITERIMA") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}.%20Untuk%20informasi%20seleksi%20silahkan%20kunjungi%20website%20https://recruitment.kai.id/news");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "DITOLAK") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Mohon%20maaf%20anda%20${widget.namaPelamar}%20telah%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}.");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "Menunggu") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Informasi%20status%20${widget.namaPelamar}%20masih%20menunggu");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Could not launch URL!")));
                      }
                    }
                  },
                  child: const Text("Email")),
              ElevatedButton(
                  onPressed: () async {
                    if (widget.cvURLPelamar != null) {
                      final Uri url = Uri.parse(widget.cvURLPelamar);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not launch URL!")));
                    }
                  },
                  child: const Text(
                    "Download CV",
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                CollectionReference ref =
                    FirebaseFirestore.instance.collection('listApplyKAI');
                ref
                    .doc(widget.namaFormasiPelamar +
                        widget.pendidikan +
                        widget.emailPelamar)
                    .delete();
                dialogInfo(
                    context,
                    "${widget.namaPelamar}-${widget.namaFormasiPelamar} DIHAPUS!",
                    1);
                futureDelayNavBack(context, 1);
              },
              child: const Text("DELETE")),
        ],
      );
    } else {
      return Container();
    }
  }
}
