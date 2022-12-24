import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/models/job_kai_model.dart';
import 'package:latihan_firebase/pages/home_page/detail_job_kai.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class JobPageKAI extends StatelessWidget {
  const JobPageKAI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('listJobKAI').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ItemCardKAI(
                listJobKAI: snapshot.data!.docs,
                lenght: snapshot.data!.docs.length,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemCardKAI extends StatelessWidget {
  final List<DocumentSnapshot> listJobKAI;
  final int lenght;
  const ItemCardKAI(
      {super.key, required this.listJobKAI, required this.lenght});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lenght,
      itemBuilder: (context, index) {
        final dataJobKAI = listJobKAI[index];
        int createAt = dataJobKAI['createAt'];
        String formasi = dataJobKAI['formasi'].toString();
        String jenisKelamin = dataJobKAI['jenisKelamin'].toString();
        String jurusan = dataJobKAI['jurusan'].toString();
        String ketentuanUmum = dataJobKAI['ketentuanUmum'];
        String keterangan = dataJobKAI['keterangan'].toString();
        String kriteriaUmum = dataJobKAI['kriteriaUmum'].toString();
        String lokasi = dataJobKAI['lokasi'].toString();
        String pendidikan = dataJobKAI['pendidikan'].toString();
        String prosedurSeleksi = dataJobKAI['prosedurSeleksi'].toString();
        String syaratDokumen = dataJobKAI['syaratDokumen'].toString();
        String tahapanSeleksi = dataJobKAI['tahapanSeleksi'].toString();
        String urlPict = dataJobKAI['urlPict'].toString();
        String persyaratanUmum = dataJobKAI['persyaratanUmum'].toString();

        return GestureDetector(
            onTap: () {
              navPushTransition(
                  context,
                  DetailJobKAI(
                      createAt: createAt,
                      formasi: formasi,
                      jenisKelamin: jenisKelamin,
                      jurusan: jurusan,
                      ketentuanUmum: ketentuanUmum,
                      keterangan: keterangan,
                      kriteriaUmum: kriteriaUmum,
                      lokasi: lokasi,
                      pendidikan: pendidikan,
                      prosedurSeleksi: prosedurSeleksi,
                      syaratDokumen: syaratDokumen,
                      tahapanSeleksi: tahapanSeleksi,
                      persyaratanUmum: persyaratanUmum,
                      urlPict: urlPict));
            },
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colorBlueSecondKAI),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 60,
                          height: 60,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(urlPict),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formasi,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: size18.copyWith(
                                  fontWeight: fw600, color: colorWhiteKAI),
                            ),
                            Text(
                              lokasi,
                              style: size14.copyWith(
                                  color: colorWhiteKAI.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorBlueKAI),
                        width: 44,
                        height: 44,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_add_outlined,
                              size: 30,
                              color: colorWhiteKAI,
                            )),
                      )
                    ],
                  ),
                  Divider(
                    color: colorWhiteSecondKAI,
                  ),
                  Text(
                    "Deskripsi : ",
                    style: size16.copyWith(
                        color: colorWhiteKAI, fontWeight: fw600),
                  ),
                  Text(
                    maxLines: 4,
                    keterangan,
                    style: size14.copyWith(
                        color: colorWhiteSecondKAI.withOpacity(0.5)),
                  ),
                ],
              ),
            ));
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
