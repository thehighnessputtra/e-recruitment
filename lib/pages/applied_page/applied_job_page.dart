import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/applied_page/appllied_job_detail.dart';

class AppliedJobPage extends StatefulWidget {
  const AppliedJobPage({super.key});

  @override
  State<AppliedJobPage> createState() => _AppliedJobPage();
}

// Stream<List<LokerModels>> readLoker(){
//   FirebaseFirestore.instance.collection('user').snapshots().map((event) => event.docs.map((e) => LokerModels));
// }

class _AppliedJobPage extends State<AppliedJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('listapply').snapshots(),
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
        String namaLoker = itemsApply['namaLoker'];
        String namaPerusahaan = itemsApply['namaPerusahaan'];
        String gaji = itemsApply['gaji'];
        String namaPelamar = itemsApply['namaPelamar'];
        String cvNamePelamar = itemsApply['cvName'];
        String cvURLPelamar = itemsApply['cvURL'];
        String emailPelamar = itemsApply['email'];
        String aboutPelamar = itemsApply['about'];
        String avatarUrlPelamar = itemsApply['avatarUrl'];
        String statusPelamar = itemsApply['status'];
        colorChangeStatus() {
          if (statusPelamar == "DITERIMA") {
            return Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                padding: const EdgeInsets.all(5),
                child: Text(statusPelamar,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            );
          } else if (statusPelamar == "DITOLAK") {
            return Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.all(5),
                child: Text(statusPelamar,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            );
          } else {
            return Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(5),
                child: Text(statusPelamar,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            );
          }
        }

        if (emailPelamar == email) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppliedJobDetail(
                      namaPelamar: namaPelamar,
                      namaLokerPelamar: namaLoker,
                      namaPerusahaanPelamar: namaPerusahaan,
                      gajiPelamar: gaji,
                      emailPelamar: emailPelamar,
                      cvNamePelamar: cvNamePelamar,
                      cvURLPelamar: cvURLPelamar,
                      aboutPelamar: aboutPelamar,
                      avatarUrlPelamar: avatarUrlPelamar,
                      statusPelamar: statusPelamar,
                    ),
                  ));
            },
            child: Card(
              color: const Color(0xFFF3F8F9),
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(namaLoker,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[800])),
                          Text(namaPelamar),
                        ],
                      ),
                    ),
                    colorChangeStatus()
                  ],
                ),
              ),
            ),
          );
        } else if (role == "Admin") {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppliedJobDetail(
                      namaPelamar: namaPelamar,
                      namaLokerPelamar: namaLoker,
                      namaPerusahaanPelamar: namaPerusahaan,
                      gajiPelamar: gaji,
                      emailPelamar: emailPelamar,
                      cvNamePelamar: cvNamePelamar,
                      cvURLPelamar: cvURLPelamar,
                      aboutPelamar: aboutPelamar,
                      avatarUrlPelamar: avatarUrlPelamar,
                      statusPelamar: statusPelamar,
                    ),
                  ));
            },
            child: Card(
              color: const Color(0xFFF3F8F9),
              elevation: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(namaLoker,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[800])),
                          Text(namaPelamar),
                        ],
                      ),
                    ),
                    colorChangeStatus()
                    // Expanded(
                    //   flex: 2,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: Colors.blue,
                    //     ),
                    //     padding: const EdgeInsets.all(5),
                    //     child: Text(statusPelamar,
                    //         textAlign: TextAlign.center,
                    //         style: const TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
