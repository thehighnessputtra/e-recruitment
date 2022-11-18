import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_firebase/pages/login_regist/login_sukses.dart';

import '../_admin/home_page/home_page.dart';
import '../_admin/navbottom_bar.dart';
import '../_user/navbottom_bar.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue.shade700, Colors.deepPurple]),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login Page",
                    style: GoogleFonts.oxygen(
                      fontSize: 35,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your email!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        hintText: "Email",
                        errorStyle: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 17),
                        prefixIconColor: Colors.white.withOpacity(0.5),
                        prefixIcon: const Icon(Icons.email),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your password!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.white.withOpacity(0.8), fontSize: 17),
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        hintText: "Password",
                        prefixIconColor: Colors.white.withOpacity(0.5),
                        prefixIcon: const Icon(Icons.key),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have a account?",
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ));
                          },
                          child: Text("Sign up now",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7)))),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          side: const MaterialStatePropertyAll(BorderSide.none),
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.white.withOpacity(0.4)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                            debugPrint("Sukses login");
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginSukses(),
                                ));
                          }
                        },
                        child: const Text("Login")),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "User") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBottomBarUser(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavBottomBarAdmin(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
