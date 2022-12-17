// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase_core/firebase_core.dart' as firebase_core;

// class FirebaseServices {
//   final firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   Future<void> uploadFile(
//     String filePath,
//     String fileName,
//   ) async {
//     File file = File(filePath);
//     try {
//       await storage.ref("files/$fileName").putFile(file);
//       // ignore: empty_catches, unused_catch_clause
//     } on firebase_core.FirebaseException catch (e) {}
//   }

//   Future<void> uploadImage(
//     String filePath,
//     String fileName,
//   ) async {
//     File file = File(filePath);
//     try {
//       await storage.ref("avatar/$fileName").putFile(file);
//     } on firebase_core.FirebaseException catch (e) {}
//   }

//   Future getDocID(
//       {required String name,
//       required String email,
//       required String role}) async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.email)
//         .get()
//         .then((snapshot) async {
//       if (snapshot.exists) {
//         name = snapshot.data()!['name'];
//         email = snapshot.data()!['email'];
//         role = snapshot.data()!['role'];
//       }
//     });
//   }
// }
