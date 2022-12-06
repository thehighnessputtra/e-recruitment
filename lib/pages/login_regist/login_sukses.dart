// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../navbottom_bar.dart';
// import 'login_page.dart';

// class LoginSukses extends StatefulWidget {
//   const LoginSukses({Key? key}) : super(key: key);

//   @override
//   State<LoginSukses> createState() => _LoginSuksesState();
// }

// class _LoginSuksesState extends State<LoginSukses> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Locked"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Center(
//             child: Column(
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => NavBottomBarUser(),
//                           ));
//                     },
//                     child: const Text("Start"))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// //   void route() {
// //     User? user = FirebaseAuth.instance.currentUser;
// //     var kk = FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(user!.uid)
// //         .get()
// //         .then((DocumentSnapshot documentSnapshot) {
// //       if (documentSnapshot.exists) {
// //         if (documentSnapshot.get('role') == "Admin") {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => const NavBottomBarAdmin(),
// //             ),
// //           );
// //         } else {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => const NavBottomBarUser(),
// //             ),
// //           );
// //         }
// //       } else {
// //         print('Document does not exist on the database');
// //         Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => const LoginPage(),
// //             ));
// //       }
// //     });
// //   }
// // }
