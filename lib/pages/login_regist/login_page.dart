import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navbottom_bar.dart';
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
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text)
                                  .then((value) => {
                                        Fluttertoast.showToast(
                                            msg: "Login Successful"),
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  NavBottomBarUser(),
                                            ))
                                      });
                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(msg: e.message.toString());
                            }
                            debugPrint("Sukses login");
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

  // void route() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == "Admin") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const NavBottomBarAdmin(),
  //           ),
  //         );
  //       } else {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const NavBottomBarUser(),
  //           ),
  //         );
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const LoginPage(),
  //           ));
  //     }
  //   });
  // }
}
