// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/tahap_seleksi/tahap2/psikotest_page.dart';
import 'package:latihan_firebase/pages/tahap_seleksi/tahap3/toefl_page.dart';
import 'package:latihan_firebase/pages/tahap_seleksi/tahap5/medical_checkup.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/data_administrasi_widget.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';
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
  final String medicalcheckupNamePelamar;
  final String medicalcheckupURLPelamar;
  final int nilaiPsikotest;
  final int nilaiToefl;
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
      required this.transNilaiURLPelamar,
      required this.nilaiPsikotest,
      required this.nilaiToefl,
      required this.medicalcheckupNamePelamar,
      required this.medicalcheckupURLPelamar});

  @override
  State<AppliedDetailKAI> createState() => _AppliedDetailKAIState();
}

class _AppliedDetailKAIState extends State<AppliedDetailKAI> {
  String? role;
  int? nilaiPsikotest;

  Future getRole() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          role = snapshot.data()!['role'];
        });
      }
    });
  }

  @override
  void initState() {
    getRole();
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
              widget.statusPelamar == "TAHAP2"
                  ? Text("Nilai Psikotest = ${widget.nilaiPsikotest}")
                  : widget.statusPelamar == "TAHAP3" ||
                          widget.statusPelamar == "TAHAP4" ||
                          widget.statusPelamar == "TAHAP5" ||
                          widget.statusPelamar == "DITERIMA" ||
                          widget.statusPelamar == "DITOLAK"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nilai Psikotest = ${widget.nilaiPsikotest}"),
                            Text("Nilai Toefl = ${widget.nilaiToefl}"),
                          ],
                        )
                      : const SizedBox(),
              // widget.statusPelamar == "TAHAP1" ||
              //         widget.statusPelamar == "TAHAP2" ||
              //         widget.statusPelamar == "TAHAP3" ||
              //         widget.statusPelamar == "TAHAP4" ||
              //         widget.statusPelamar == "TAHAP5"
              //     ? Text("Nilai Psikotest = ${widget.nilaiPsikotest}")
              //     : const SizedBox(),
              widget.statusPelamar == "TAHAP1"
                  ? const Text(
                      "Mohon menunggu beberapa hari untuk seleksi TAHAP1 Administrasi")
                  : widget.statusPelamar == "TAHAP2"
                      ? widget.nilaiPsikotest < 5
                          ? TextButton(
                              onPressed: () {
                                navPushTransition(
                                    context,
                                    PsikotestPage(
                                      namaFormasi: widget.namaFormasiPelamar,
                                      email: widget.emailPelamar,
                                      pendidikan: widget.pendidikan,
                                    ));
                              },
                              child: const Text("Mengejarkan Psikotest"))
                          : const SizedBox()
                      : widget.statusPelamar == "TAHAP3"
                          ? widget.nilaiToefl < 5
                              ? TextButton(
                                  onPressed: () {
                                    navPushTransition(
                                        context,
                                        ToeflPage(
                                          namaFormasi:
                                              widget.namaFormasiPelamar,
                                          email: widget.emailPelamar,
                                          pendidikan: widget.pendidikan,
                                        ));
                                  },
                                  child: const Text("Mengejarkan Toefl"))
                              : const SizedBox()
                          : widget.statusPelamar == "TAHAP4"
                              ? Text(
                                  "Silahkan check email untuk informasi TAHAP4 Wawancara!",
                                  style: size18.copyWith(fontWeight: fw800),
                                )
                              : widget.statusPelamar == "TAHAP5"
                                  ? TextButton(
                                      child: const Text(
                                          "Lampirkan hasil medical checkup"),
                                      onPressed: () {
                                        navPushTransition(
                                            context,
                                            MedicalCheckupPage(
                                              namaFormasi:
                                                  widget.namaFormasiPelamar,
                                              email: widget.emailPelamar,
                                              pendidikan: widget.pendidikan,
                                            ));
                                      },
                                    )
                                  : const SizedBox(),
              widget.statusPelamar == "TAHAP5"
                  ? DataAdministrasi(
                      onTap: () async {
                        if (widget.medicalcheckupURLPelamar != null) {
                          final Uri url =
                              Uri.parse(widget.medicalcheckupURLPelamar);
                          if (!await launchUrl(url,
                              mode: LaunchMode.externalApplication)) {
                            throw "Could not launch $url";
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Could not launch URL!")));
                        }
                      },
                      fileAdministrasi: widget.medicalcheckupNamePelamar,
                      namaAdminstrasi: "Medical checkup")
                  : const SizedBox(),
              const SizedBox(
                height: 20.0,
              ),
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
                                        "${widget.namaPelamar}-${widget.namaFormasiPelamar} TAHAP4!",
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
                                            "${widget.namaPelamar}-${widget.namaFormasiPelamar} TAHAP5!",
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
                            "mailto:${widget.emailPelamar}?subject=${widget.statusPelamar}_${widget.namaFormasiPelamar}(${widget.pendidikan})_${widget.namaPelamar}&body=Yth%20${widget.namaPelamar}%2C%0D%0AAnda%20dapat%20mengikuti%20seleksi%20TAHAP1%20Administrasi%20pada%20${widget.namaFormasiPelamar}%20${widget.pendidikan}%2C%20${widget.lokasiPelamar}%20pastikan%20anda%20melampirkan%20data%20Administrasi%20yang%20benar%20dan%20sesuai!%0D%0A%0D%0AJika%20ada%20pertanyaan%20bisa%20menghubungi%20Customer%20Service%20pada%20aplikasi%20atau%20WhatsApp%20https%3A%2F%2Fwa.me%2F6289652366540");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP2") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?subject=${widget.statusPelamar}_${widget.namaFormasiPelamar}(${widget.pendidikan})_${widget.namaPelamar}&body=Yth%20${widget.namaPelamar}%2C%0D%0AAnda%20diundang%20untuk%20mengikuti%20tes%20seleksi%20${widget.namaFormasiPelamar}%20${widget.pendidikan}%2C%20${widget.lokasiPelamar}%20sebagai%20berikut%20%3A%0D%0A%0D%0ATahapan%20Tes%20%3A%20${widget.statusPelamar}%20-%20Psikotest%0D%0AEmail%20Peserta%20%3A%20${widget.emailPelamar}%0D%0ATempat%20%3A%20Aplikasi%20E-Recruitment%20Jobfinders%0D%0A%0D%0AJika%20ada%20pertanyaan%20bisa%20menghubungi%20Customer%20Service%20pada%20aplikasi%20atau%20WhatsApp%20https%3A%2F%2Fwa.me%2F6289652366540");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP3") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?subject=${widget.statusPelamar}_${widget.namaFormasiPelamar}(${widget.pendidikan})_${widget.namaPelamar}&body=Yth%20${widget.namaPelamar}%2C%0D%0AAnda%20diundang%20untuk%20mengikuti%20test%20TOEFL%20pada%20${widget.namaFormasiPelamar}%20${widget.pendidikan}%2C%20${widget.lokasiPelamar}%20sebagai%20berikut%20%3A%0D%0A%0D%0ATahapan%20Tes%20%3A%20${widget.statusPelamar}%20-%20TOEFL%0D%0AEmail%20Peserta%20%3A%20${widget.emailPelamar}%0D%0ATempat%20%3A%20Aplikasi%20E-Recruitment%20Jobfinders%0D%0A%0D%0AJika%20ada%20pertanyaan%20bisa%20menghubungi%20Customer%20Service%20pada%20aplikasi%20atau%20WhatsApp%20https%3A%2F%2Fwa.me%2F6289652366540");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP4") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?subject=${widget.statusPelamar}_${widget.namaFormasiPelamar}(${widget.pendidikan})_${widget.namaPelamar}&body=Yth%20${widget.namaPelamar}%2C%0D%0AAnda%20diundang%20untuk%20mengikuti%20test%20WAWANCARA%20pada%20${widget.namaFormasiPelamar}%20${widget.pendidikan}%2C%20${widget.lokasiPelamar}%20sebagai%20berikut%20%3A%0D%0A%0D%0ATahapan%20Tes%20%3A%20${widget.statusPelamar}%20-%20WAWANCARA%0D%0AEmail%20Peserta%20%3A%20${widget.emailPelamar}%0D%0ATempat%20%3A%20Link%20GMeet%0D%0AHari/Tanggal%20%3A%20Hari, %20Tanggal%0D%0AWaktu%20%3A%20Waktu%0D%0A%0D%0AJika%20ada%20pertanyaan%20bisa%20menghubungi%20Customer%20Service%20pada%20aplikasi%20atau%20WhatsApp%20https%3A%2F%2Fwa.me%2F6289652366540");
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw "Could not launch $url";
                        }
                      } else if (widget.statusPelamar == "TAHAP5") {
                        final Uri url = Uri.parse(
                            "mailto:${widget.emailPelamar}?subject=${widget.statusPelamar}_${widget.namaFormasiPelamar}(${widget.pendidikan})_${widget.namaPelamar}&body=Yth%20${widget.namaPelamar}%2C%0D%0ASelamat%20anda%20sudah%20sampai%20ditahap%20terakhir%20yaitu%20TAHAP5%20Medical%20check-up%20pada%20${widget.namaFormasiPelamar}%20${widget.pendidikan}%2C%20${widget.lokasiPelamar}.%20untuk%20menyelesaikan%20tahap%20ini%20silahkan%20anda%20melampirkan%20hasil%20Medical%20check-up%20anda%20pada%20Aplikasi%20E-Recruitment%20Jobfinders%0D%0A%0D%0AJika%20ada%20pertanyaan%20bisa%20menghubungi%20Customer%20Service%20pada%20aplikasi%20atau%20WhatsApp%20https%3A%2F%2Fwa.me%2F6289652366540");
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
