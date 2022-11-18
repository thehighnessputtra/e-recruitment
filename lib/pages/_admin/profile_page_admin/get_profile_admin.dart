import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../login_regist/login_page.dart';
import 'edit_profile_page_admin.dart';

class GetProfileDetailAdmin extends StatelessWidget {
  final String docsID;
  const GetProfileDetailAdmin({Key? key, required this.docsID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(docsID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Center(
                child: Stack(
                  children: [
                    ClipOval(
                        child: Material(
                            child: Ink.image(
                      image: const AssetImage("assets/images/admin.jpeg"),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ))),
                    Positioned(
                        bottom: 0,
                        right: 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EditProfileAdmin(),
                                ));
                          },
                          child: ClipOval(
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                      border: Border.fromBorderSide(BorderSide(
                                          width: 2.5, color: Colors.white))),
                                  padding: const EdgeInsets.all(8),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: Colors.white,
                                  ))),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  "${data['name']} (${data['role']})",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: Text(
                  data['email'],
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: const MaterialStatePropertyAll(0),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: const Text("Logout")),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "About",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17, height: 1.3),
                    ),
                  ],
                ),
              ),
            ],
          );
          // Text(data['name'] + data['role']);
        }
        return const Text("Loading...");
      },
    );
  }
}
