// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/data_administrasi_widget.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppliedDetailKAI extends StatefulWidget {
  final String biografiPelamar;
  final String avatarUrlPelamar;
  final String cvNamePelamar;
  final String cvURLPelamar;
  final String ktpNamePelamar;
  final String ktpURLPelamar;
  final String ijazahNamePelamar;
  final String ijazahURLPelamar;
  final String toeflNamePelamar;
  final String toeflURLPelamar;
  final String transNilaiNamePelamar;
  final String transNilaiURLPelamar;
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
      required this.pendidikan,
      required this.ktpNamePelamar,
      required this.ktpURLPelamar,
      required this.ijazahNamePelamar,
      required this.ijazahURLPelamar,
      required this.toeflNamePelamar,
      required this.toeflURLPelamar,
      required this.transNilaiNamePelamar,
      required this.transNilaiURLPelamar});

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
              widget.statusPelamar == "TAHAP1" ||
                      widget.statusPelamar == "TAHAP2" ||
                      widget.statusPelamar == "TAHAP3" ||
                      widget.statusPelamar == "TAHAP4" ||
                      widget.statusPelamar == "TAHAP5"
                  ? const Text("Nilai Psikotest = ")
                  : const SizedBox(),
              widget.statusPelamar == "TAHAP1"
                  ? const Text(
                      "Mohon menunggu beberapa hari untuk seleksi TAHAP1 Administrasi")
                  : widget.statusPelamar == "TAHAP2"
                      ? TextButton(
                          onPressed: () {},
                          child: const Text("Mengejarkan Psikotest"))
                      : widget.statusPelamar == "TAHAP3"
                          ? TextButton(
                              onPressed: () {},
                              child: const Text("Mengerjakan Toefl"))
                          : widget.statusPelamar == "TAHAP4"
                              ? TextButton(
                                  onPressed: () {},
                                  child: const Text("Mulai Test Wawancara"))
                              : widget.statusPelamar == "TAHAP5"
                                  ? const Text(
                                      "Lampirkan hasil medical checkup")
                                  : const SizedBox(),
              DataAdministrasi(
                  fileAdministrasi: widget.namaPelamar,
                  namaAdminstrasi: "Nama"),
              DataAdministrasi(
                  fileAdministrasi: widget.emailPelamar,
                  namaAdminstrasi: "Email"),
              DataAdministrasi(
                  onTap: () async {
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
                  fileAdministrasi: widget.cvNamePelamar,
                  namaAdminstrasi: "Curriculum Vitae"),
              DataAdministrasi(
                  onTap: () async {
                    if (widget.ktpURLPelamar != null) {
                      final Uri url = Uri.parse(widget.ktpURLPelamar);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not launch URL!")));
                    }
                  },
                  fileAdministrasi: widget.ktpNamePelamar,
                  namaAdminstrasi: "Identitas KTP"),
              DataAdministrasi(
                  onTap: () async {
                    if (widget.ijazahURLPelamar != null) {
                      final Uri url = Uri.parse(widget.ijazahURLPelamar);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not launch URL!")));
                    }
                  },
                  fileAdministrasi: widget.ijazahNamePelamar,
                  namaAdminstrasi: "Ijazah"),
              DataAdministrasi(
                  onTap: () async {
                    if (widget.toeflURLPelamar != null) {
                      final Uri url = Uri.parse(widget.toeflURLPelamar);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not launch URL!")));
                    }
                  },
                  fileAdministrasi: widget.toeflNamePelamar,
                  namaAdminstrasi: "TOEFL"),
              DataAdministrasi(
                  onTap: () async {
                    if (widget.transNilaiURLPelamar != null) {
                      final Uri url = Uri.parse(widget.transNilaiURLPelamar);
                      if (!await launchUrl(url,
                          mode: LaunchMode.externalApplication)) {
                        throw "Could not launch $url";
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Could not launch URL!")));
                    }
                  },
                  fileAdministrasi: widget.transNilaiNamePelamar,
                  namaAdminstrasi: "Transkrip Nilai"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Biografi",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextFormField(
                    maxLines: 5,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: colorBlueSecondKAI)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.5, color: colorBlueSecondKAI)),
                      hintText: widget.biografiPelamar,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
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
              widget.statusPelamar == "Menunggu"
                  ? ElevatedButton(
                      onPressed: () {
                        CollectionReference ref = FirebaseFirestore.instance
                            .collection('listApplyKAI');
                        ref
                            .doc(widget.namaFormasiPelamar +
                                widget.pendidikan +
                                widget.emailPelamar)
                            .update({
                          'status': "TAHAP1",
                        });
                        dialogInfo(
                            context,
                            "${widget.namaPelamar}-${widget.namaFormasiPelamar} TAHAP1!",
                            1);
                        futureDelayNavBack(context, 1);
                      },
                      child: const Text("Tahap 1"))
                  : widget.statusPelamar == "TAHAP1"
                      ? ElevatedButton(
                          onPressed: () {
                            CollectionReference ref = FirebaseFirestore.instance
                                .collection('listApplyKAI');
                            ref
                                .doc(widget.namaFormasiPelamar +
                                    widget.pendidikan +
                                    widget.emailPelamar)
                                .update({
                              'status': "TAHAP2",
                            });
                            dialogInfo(
                                context,
                                "${widget.namaPelamar}-${widget.namaFormasiPelamar} TAHAP2!",
                                1);
                            futureDelayNavBack(context, 1);
                          },
                          child: const Text("Tahap 2"))
                      : widget.statusPelamar == "TAHAP2"
                          ? ElevatedButton(
                              onPressed: () {
                                CollectionReference ref = FirebaseFirestore
                                    .instance
                                    .collection('listApplyKAI');
                                ref
                                    .doc(widget.namaFormasiPelamar +
                                        widget.pendidikan +
                                        widget.emailPelamar)
                                    .update({
                                  'status': "TAHAP3",
                                });
                                dialogInfo(
                                    context,
                                    "${widget.namaPelamar}-${widget.namaFormasiPelamar} TAHAP3!",
                                    1);
                                futureDelayNavBack(context, 1);
                              },
                              child: const Text("Tahap 3"))
                          : widget.statusPelamar == "TAHAP3"
                              ? ElevatedButton(
                                  onPressed: () {
                                    CollectionReference ref = FirebaseFirestore
                                        .instance
                                        .collection('listApplyKAI');
                                    ref
                                        .doc(widget.namaFormasiPelamar +
                                            widget.pendidikan +
                                            widget.emailPelamar)
                                        .update({
                                      'status': "TAHAP4",
                                    });
                                    dialogInfo(
                                        context,
                                        "${widget.namaPelamar}-${widget.namaFormasiPelamar} DITERIMA!",
                                        1);
                                    futureDelayNavBack(context, 1);
                                  },
                                  child: const Text("Tahap 4"))
                              : widget.statusPelamar == "TAHAP4"
                                  ? ElevatedButton(
                                      onPressed: () {
                                        CollectionReference ref =
                                            FirebaseFirestore.instance
                                                .collection('listApplyKAI');
                                        ref
                                            .doc(widget.namaFormasiPelamar +
                                                widget.pendidikan +
                                                widget.emailPelamar)
                                            .update({
                                          'status': "TAHAP5",
                                        });
                                        dialogInfo(
                                            context,
                                            "${widget.namaPelamar}-${widget.namaFormasiPelamar} DITERIMA!",
                                            1);
                                        futureDelayNavBack(context, 1);
                                      },
                                      child: const Text("Tahap 5"))
                                  : const SizedBox(),
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
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}.%20Untuk%20informasi%20selanjutnya%20silahkan%20kunjungi%20website%20https://recruitment.kai.id/news");
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
                      } else if (widget.statusPelamar == "TAHAP1") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20LOLOS%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}.%20Silahkan%20lanjut%20 ke%20 TAHAP2%20 Psikotest%20 dengan%20 maksimal%20 pengerjaan%20 2%20 hari!.%20 Terimakasih");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP2") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20LOLOS%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}%20 dengan%20 nilai%20xx.%20Untuk%20informasi%20selanjutnya%20silahkan%20kunjungi%20website%20https://recruitment.kai.id/news");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP3") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20LOLOS%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}%20 dengan%20 nilai%20xx. %20Silahkan%20 melanjutkan%20 ke%20 TAHAP4%20 Wawancara%20Untuk%20%20informasi%20selanjutnya%20silahkan%20kunjungi%20website%20https://recruitment.kai.id/news");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP4") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaFormasiPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20LOLOS%20${widget.statusPelamar}%20di%20PT%20KAI%20${widget.lokasiPelamar}%20sebagai%20${widget.namaFormasiPelamar}%20 Silahkan %20melanjutkan %20TAHAP5 %20Medical %20Check-up.%20Untuk%20informasi%20selanjutnya%20silahkan%20kunjungi%20website%20https://recruitment.kai.id/news");
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