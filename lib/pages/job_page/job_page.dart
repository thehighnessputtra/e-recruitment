import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan_firebase/pages/job_page/job_detail.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

// Stream<List<LokerModels>> readLoker(){
//   FirebaseFirestore.instance.collection('user').snapshots().map((event) => event.docs.map((e) => LokerModels));
// }

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('listLoker').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemLoker(
                listLoker: snapshot.data!.docs,
                lenght: snapshot.data!.docs.length,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  // addJob() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.email)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == "Admin") {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const CreateLoker(),
  //           ),
  //         );
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
}

class ItemLoker extends StatelessWidget {
  final List<DocumentSnapshot> listLoker;
  final int lenght;
  const ItemLoker({super.key, required this.listLoker, required this.lenght});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lenght,
      itemBuilder: (context, index) {
        final itemsLoker = listLoker[index];
        String lokasi = itemsLoker['lokasi'].toString();
        String namaLoker = itemsLoker['namaLoker'].toString();
        String namaPerusahaan = itemsLoker['namaPerusahaan'].toString();
        String tipePekerjaan = itemsLoker['tipePekerjaan'].toString();
        String gaji = itemsLoker['gaji'];
        String urlLogo = itemsLoker['urlLogo'].toString();
        String deskripsiKualifikasi =
            itemsLoker['deskripsiKualifikasi'].toString();
        String deskripsiKeahlian = itemsLoker['deskripsiKeahlian'].toString();
        String deskripsiPerusahaan =
            itemsLoker['deskripsiPerusahaan'].toString();

        return GestureDetector(
          onTap: () {
            navPushTransition(
              context,
              JobDetailUser(
                  deskripsiKeahlian: deskripsiKeahlian,
                  deskripsiKualifikasi: deskripsiKualifikasi,
                  deskripsiPerusahaan: deskripsiPerusahaan,
                  gaji: gaji,
                  urlLogo: urlLogo,
                  lokasi: lokasi,
                  namaLoker: namaLoker,
                  namaPerusahaan: namaPerusahaan,
                  tipePekerjaan: tipePekerjaan),
            );
          },
          child: Card(
            color: const Color(0xFFF3F8F9),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                        Text(lokasi),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: gaji == "Negosiasi"
                          ? const Text("Negosiasi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ))
                          : Text(
                              NumberFormat.currency(
                                      locale: 'id',
                                      symbol: 'RP ',
                                      decimalDigits: 0)
                                  .format(double.parse(gaji)),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        // Padding(
        //   padding: const EdgeInsets.only(top: 5),
        //   child: ListTile(
        //     shape:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //     tileColor: Colors.blue[800],
        //     title: Text(
        //       namaLoker,
        //       style: const TextStyle(
        //           color: Colors.white,
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold),
        //     ),
        //     subtitle: Text(
        //       "$namaPerusahaan, $lokasi",
        //       style: const TextStyle(color: Colors.white),
        //     ),
        //     trailing: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         const Icon(Icons.monetization_on, color: Colors.white),
        //         Text(
        //           gaji,
        //           style: const TextStyle(color: Colors.white),
        //         )
        //       ],
        //     ),
        //     onTap: () async {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => JobDetailUser(
        //                 deskripsiKeahlian: deskripsiKeahlian,
        //                 deskripsiKualifikasi: deskripsiKualifikasi,
        //                 deskripsiPerusahaan: deskripsiPerusahaan,
        //                 gaji: gaji,
        //                 urlLogo: urlLogo,
        //                 lokasi: lokasi,
        //                 namaLoker: namaLoker,
        //                 namaPerusahaan: namaPerusahaan,
        //                 tipePekerjaan: tipePekerjaan),
        //           ));
        //     },
        //   ),
        // );
      },
    );
  }
}
