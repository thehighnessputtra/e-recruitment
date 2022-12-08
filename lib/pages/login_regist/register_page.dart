import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
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
                    "Register Page",
                    style: GoogleFonts.oxygen(
                      fontSize: 35,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _nameController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your name!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(0.2),
                        filled: true,
                        hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.5)),
                        hintText: "Name",
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
                        "Already have account?",
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: Text("Sign in now",
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
                          signUp(
                              _emailController.text,
                              _passwordController.text,
                              "User",
                              _nameController.text);
                        },
                        child: const Text("Register")),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void signUp(String email, String password, String role, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role, name)})
          .catchError((e) {});
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
    }
  }

  postDetailsToFirestore(String email, String role, String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.email).set({
      'email': _emailController.text,
      'role': "User",
      'name': _nameController.text,
      'cvName': "Masukan CV anda!"
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
