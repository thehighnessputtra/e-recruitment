import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/applied_page/applied_detail_kai.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class AppliedJobKAI extends StatefulWidget {
  const AppliedJobKAI({super.key});

  @override
  State<AppliedJobKAI> createState() => _AppliedJobKAI();
}

// Stream<List<LokerModels>> readLoker(){
//   FirebaseFirestore.instance.collection('user').snapshots().map((event) => event.docs.map((e) => LokerModels));
// }

class _AppliedJobKAI extends State<AppliedJobKAI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('listApplyKAI').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListApply(
                listApply: snapshot.data!.docs,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListApply extends StatefulWidget {
  final List<DocumentSnapshot> listApply;
  const ListApply({super.key, required this.listApply});

  @override
  State<ListApply> createState() => _ListApplyState();
}

class _ListApplyState extends State<ListApply> {
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
    return ListView.builder(
        itemCount: widget.listApply.length,
        itemBuilder: (context, index) {
          final itemsApply = widget.listApply[index];
          String biografi = itemsApply['about'];
          String avatarUrl = itemsApply['avatarUrl'];
          String cvName = itemsApply['cvName'];
          String cvURL = itemsApply['cvURL'];
          String ktpName = itemsApply['ktpName'];
          String ktpURL = itemsApply['ktpURL'];
          String ijazahName = itemsApply['ijazahName'];
          String ijazahURL = itemsApply['ijazahURL'];
          String toeflName = itemsApply['toeflName'];
          String toeflURL = itemsApply['toeflURL'];
          String transNilaiName = itemsApply['transNilaiName'];
          String transNilaiURL = itemsApply['transNilaiURL'];
          String emailPelamar = itemsApply['email'];
          String lokasi = itemsApply['lokasi'];
          String namaFormasi = itemsApply['namaFormasi'];
          String namaPelamar = itemsApply['namaPelamar'];
          String status = itemsApply['status'];
          String pendidikan = itemsApply['pendidikan'];

          return GestureDetector(
              onTap: () {
                navPushTransition(
                    context,
                    AppliedDetailKAI(
                        pendidikan: pendidikan,
                        biografiPelamar: biografi,
                        avatarUrlPelamar: avatarUrl,
                        cvNamePelamar: cvName,
                        cvURLPelamar: cvURL,
                        ktpNamePelamar: ktpName,
                        ktpURLPelamar: ktpURL,
                        ijazahNamePelamar: ijazahName,
                        ijazahURLPelamar: ijazahURL,
                        toeflNamePelamar: toeflName,
                        toeflURLPelamar: toeflURL,
                        transNilaiNamePelamar: transNilaiName,
                        transNilaiURLPelamar: transNilaiURL,
                        emailPelamar: emailPelamar,
                        lokasiPelamar: lokasi,
                        namaFormasiPelamar: namaFormasi,
                        namaPelamar: namaPelamar,
                        statusPelamar: status));
              },
              child: email == emailPelamar
                  ? Card(
                      color: const Color(0xFFF3F8F9),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$namaFormasi ($pendidikan)",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: colorBlueSecondKAI)),
                                  Text(namaPelamar),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: status == "DITERIMA"
                                        ? Colors.green
                                        : status == "DITOLAK"
                                            ? Colors.red
                                            : status == "Menunggu"
                                                ? colorOrangeSecondKAI
                                                : Colors.blue),
                                padding: const EdgeInsets.all(5),
                                child: Text(status,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : role == "Admin"
                      ? Card(
                          color: const Color(0xFFF3F8F9),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("$namaFormasi ($pendidikan)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: colorBlueSecondKAI)),
                                      Text(namaPelamar),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: status == "Menunggu"
                                          ? colorOrangeSecondKAI
                                          : status == "DITERIMA"
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Text(status,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : SizedBox());
        });
  }
}
