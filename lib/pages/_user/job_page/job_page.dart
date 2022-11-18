import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('listLoker').snapshots(),
        builder: (context, snapshot) {
          return snapshot.data!.docs.isEmpty
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ItemLoker(
                    listLoker: snapshot.data!.docs,
                  ),
                );
        },
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

class ItemLoker extends StatelessWidget {
  final List<DocumentSnapshot> listLoker;
  const ItemLoker({super.key, required this.listLoker});

  @override
  Widget build(BuildContext context) {
    return listLoker.isEmpty
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: listLoker.length,
            itemBuilder: (context, index) {
              final itemsLoker = listLoker[index];
              String lokasi = itemsLoker['lokasi'].toString();
              String namaLoker = itemsLoker['namaLoker'].toString();
              String namaPerusahaan = itemsLoker['namaPerusahaan'].toString();
              String tipePekerjaan = itemsLoker['tipePekerjaan'].toString();
              String gaji = itemsLoker['gaji'].toString();
              String deskripsiKualifikasi =
                  itemsLoker['deskripsiKualifikasi'].toString();
              String deskripsiKeahlian =
                  itemsLoker['deskripsiKeahlian'].toString();
              String deskripsiPerusahaan =
                  itemsLoker['deskripsiPerusahaan'].toString();

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
                    "$namaPerusahaan, $lokasi",
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
                    await showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  const Text(
                                    "Deskripsi Perusahaan :",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(deskripsiPerusahaan),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text(
                                    "Keahlian :",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(deskripsiKeahlian),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text(
                                    "Kualifikasi :",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(deskripsiKualifikasi),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
  }
}
