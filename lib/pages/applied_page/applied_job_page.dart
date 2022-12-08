import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

class ListApply extends StatelessWidget {
  final List<DocumentSnapshot> listApply;
  const ListApply({super.key, required this.listApply});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listApply.length,
      itemBuilder: (context, index) {
        final itemsApply = listApply[index];
        String namaLoker = itemsApply['namaLoker'];
        String namaPerusahaan = itemsApply['namaPerusahaan'];
        String gaji = itemsApply['gaji'];
        String namaPelamar = itemsApply['namaPelamar'];
        String cvName = itemsApply['cvName'];
        String cvURL = itemsApply['cvURL'];

        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => JobDetailUser(
              //           deskripsiKeahlian: deskripsiKeahlian,
              //           deskripsiKualifikasi: deskripsiKualifikasi,
              //           deskripsiPerusahaan: deskripsiPerusahaan,
              //           gaji: gaji,
              //           urlLogo: urlLogo,
              //           lokasi: lokasi,
              //           namaLoker: namaLoker,
              //           namaPerusahaan: namaPerusahaan,
              //           tipePekerjaan: tipePekerjaan),
              //     ));
              // await showModalBottomSheet<void>(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       padding: const EdgeInsets.all(20.0),
              //       child: SizedBox(
              //         width: MediaQuery.of(context).size.width,
              //         child: SingleChildScrollView(
              //           scrollDirection: Axis.vertical,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               const SizedBox(
              //                 height: 10.0,
              //               ),
              //               const Text(
              //                 "Deskripsi Perusahaan :",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               ),
              //               Text(deskripsiPerusahaan),
              //               const SizedBox(
              //                 height: 5.0,
              //               ),
              //               const Text(
              //                 "Keahlian :",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               ),
              //               Text(deskripsiKeahlian),
              //               const SizedBox(
              //                 height: 5.0,
              //               ),
              //               const Text(
              //                 "Kualifikasi :",
              //                 style: TextStyle(
              //                     fontSize: 15, fontWeight: FontWeight.bold),
              //               ),
              //               Text(deskripsiKualifikasi),
              //               ElevatedButton(
              //                 style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.blueGrey,
              //                 ),
              //                 onPressed: () {
              //                   Navigator.pop(context);
              //                 },
              //                 child: const Text("Ok"),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // );
            },
          ),
        );
      },
    );
  }
}
