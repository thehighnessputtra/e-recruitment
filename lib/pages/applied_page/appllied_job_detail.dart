// // ignore_for_file: unnecessary_null_comparison

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:latihan_firebase/widget/dialog_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AppliedJobDetail extends StatefulWidget {
//   final String namaPelamar;
//   final String namaLokerPelamar;
//   final String namaPerusahaanPelamar;
//   final String gajiPelamar;
//   final String emailPelamar;
//   final String cvNamePelamar;
//   final String cvURLPelamar;
//   final String aboutPelamar;
//   final String avatarUrlPelamar;
//   final String statusPelamar;

//   const AppliedJobDetail(
//       {super.key,
//       required this.namaPelamar,
//       required this.namaLokerPelamar,
//       required this.namaPerusahaanPelamar,
//       required this.gajiPelamar,
//       required this.emailPelamar,
//       required this.cvNamePelamar,
//       required this.cvURLPelamar,
//       required this.aboutPelamar,
//       required this.avatarUrlPelamar,
//       required this.statusPelamar});

//   @override
//   State<AppliedJobDetail> createState() => _AppliedJobDetailState();
// }

// class _AppliedJobDetailState extends State<AppliedJobDetail> {
//   String? name;
//   String? email;
//   String? role;
//   String? cvName;
//   String? cvURL;
//   String? about;
//   String? avatarUrl;
//   Future getDocID() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.email)
//         .get()
//         .then((snapshot) async {
//       if (snapshot.exists) {
//         setState(() {
//           name = snapshot.data()!['name'];
//           email = snapshot.data()!['email'];
//           role = snapshot.data()!['role'];
//           cvName = snapshot.data()!['cvName'];
//           cvURL = snapshot.data()!['cvURL'];
//           about = snapshot.data()!['about'];
//           avatarUrl = snapshot.data()!['avatarUrl'];
//         });
//       }
//     });
//   }

//   @override
//   void initState() {
//     getDocID();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: const Text("Data Pelamar"),
//         ),
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     ClipOval(
//                         child: Material(
//                             child: Ink.image(
//                       image: NetworkImage(widget.avatarUrlPelamar),
//                       fit: BoxFit.cover,
//                       width: 100,
//                       height: 100,
//                     ))),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 4,
//                     child: Text(widget.namaLokerPelamar,
//                         style: const TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold)),
//                   ),
//                   const SizedBox(
//                     width: 10.0,
//                   ),
//                   colorStatus()
//                 ],
//               ),
//               const SizedBox(
//                 height: 10.0,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(
//                       flex: 2,
//                       child: Text("Nama", style: TextStyle(fontSize: 16))),
//                   const Text(" : ", style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     flex: 4,
//                     child: Text(widget.namaPelamar,
//                         style: const TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(
//                       flex: 2,
//                       child: Text("Email", style: TextStyle(fontSize: 16))),
//                   const Text(" : ", style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     flex: 4,
//                     child: Text(widget.emailPelamar,
//                         style: const TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(
//                       flex: 2,
//                       child: Text("Curriculum Vitae",
//                           style: TextStyle(fontSize: 16))),
//                   const Text(" : ", style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     flex: 4,
//                     child: Text(widget.cvNamePelamar,
//                         style: const TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Expanded(
//                       flex: 2,
//                       child: Text("About", style: TextStyle(fontSize: 16))),
//                   const Text(" : ", style: TextStyle(fontSize: 16)),
//                   Expanded(
//                     flex: 4,
//                     child: Text(widget.aboutPelamar,
//                         style: const TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               adminController()
//             ],
//           ),
//         ));
//   }

//   colorStatus() {
//     if (widget.statusPelamar == "DITERIMA") {
//       return Expanded(
//         flex: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: Colors.green,
//           ),
//           padding: const EdgeInsets.all(5),
//           child: Text(widget.statusPelamar,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//         ),
//       );
//     } else if (widget.statusPelamar == "DITOLAK") {
//       return Expanded(
//         flex: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: Colors.red,
//           ),
//           padding: const EdgeInsets.all(5),
//           child: Text(widget.statusPelamar,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//         ),
//       );
//     } else {
//       return Expanded(
//         flex: 2,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: Colors.blue,
//           ),
//           padding: const EdgeInsets.all(5),
//           child: Text(widget.statusPelamar,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               )),
//         ),
//       );
//     }
//   }

//   adminController() {
//     // if (user!.email == "prayogidwicahyoputra@gmail.com") {
//     if (role == "Admin") {
//       return Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     CollectionReference ref =
//                         FirebaseFirestore.instance.collection('listapply');
//                     ref
//                         .doc(widget.emailPelamar + widget.namaLokerPelamar)
//                         .update({
//                       'status': "DITERIMA",
//                     });
//                     dialogInfo(
//                         context,
//                         "${widget.namaPelamar}-${widget.namaLokerPelamar} DITERIMA!",
//                         1);
//                     futureDelayNavBack(context, 1);
//                   },
//                   child: const Text("Terima")),
//               ElevatedButton(
//                   onPressed: () {
//                     CollectionReference ref =
//                         FirebaseFirestore.instance.collection('listapply');
//                     ref
//                         .doc(widget.emailPelamar + widget.namaLokerPelamar)
//                         .update({
//                       'status': "DITOLAK",
//                     });
//                     dialogInfo(
//                         context,
//                         "${widget.namaPelamar}-${widget.namaLokerPelamar} DITOLAK!",
//                         1);
//                     futureDelayNavBack(context, 1);
//                   },
//                   child: const Text("Tolak")),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (widget.emailPelamar != null) {
//                       final Uri url = Uri.parse(
//                           "mailto:${widget.emailPelamar}?cc=&bcc=&subject=${widget.statusPelamar}_${widget.namaPelamar}_${widget.namaLokerPelamar}&body=Selamat%20anda%20${widget.namaPelamar}%20telah%20${widget.statusPelamar}%20di%20${widget.namaPerusahaanPelamar}%20sebagai%20${widget.namaLokerPelamar}");
//                       if (!await launchUrl(url,
//                           mode: LaunchMode.externalApplication)) {
//                         throw "Could not launch $url";
//                       }
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                           content: Text("Could not launch URL!")));
//                     }
//                   },
//                   child: const Text("Email")),
//               ElevatedButton(
//                   onPressed: () async {
//                     if (widget.cvURLPelamar != null) {
//                       final Uri url = Uri.parse(widget.cvURLPelamar);
//                       if (!await launchUrl(url,
//                           mode: LaunchMode.externalApplication)) {
//                         throw "Could not launch $url";
//                       }
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                           content: Text("Could not launch URL!")));
//                     }
//                   },
//                   child: const Text(
//                     "Download CV",
//                   )),
//             ],
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 CollectionReference ref =
//                     FirebaseFirestore.instance.collection('listapply');
//                 ref.doc(widget.emailPelamar + widget.namaLokerPelamar).delete();
//                 dialogInfo(
//                     context,
//                     "${widget.namaPelamar}-${widget.namaLokerPelamar} DIHAPUS!",
//                     1);
//                 futureDelayNavBack(context, 1);
//               },
//               child: const Text("DELETE")),
//         ],
//       );
//     } else {
//       return Container();
//     }
//   }
// }
