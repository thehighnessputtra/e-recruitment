import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/applied_page/appllied_job_detail.dart';
import 'package:latihan_firebase/pages/job_page/create_loker.dart';
import 'package:latihan_firebase/pages/job_page/job_detail.dart';

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
        if (emailPelamar == email) {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blue[800],
              title: Text(
                namaLoker,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "$namaPerusahaan, $namaPelamar",
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.monetization_on, color: Colors.white),
                  Text(
                    gaji,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              onTap: () async {
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
            ),
          );
        } else if (role == "Admin") {
          return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              tileColor: Colors.blue[800],
              title: Text(
                namaLoker,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "$namaPerusahaan, $namaPelamar",
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.monetization_on, color: Colors.white),
                  Text(
                    gaji,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              onTap: () async {
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
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
