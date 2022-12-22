import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_firebase/services/firebase_service.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 160.0,
                  ),
                  Text(
                    "Register Page",
                    style: size30,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your name!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Name",
                        errorStyle: TextStyle(
                            color: Colors.red.withOpacity(0.8), fontSize: 17),
                        prefixIcon: const Icon(Icons.person),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor))),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your email!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        hintText: "Email",
                        errorStyle: TextStyle(
                            color: Colors.red.withOpacity(0.8), fontSize: 17),
                        prefixIcon: const Icon(Icons.email),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor))),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please input your password!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.red.withOpacity(0.8), fontSize: 17),
                        filled: true,
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.key),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: blackColor))),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have account?"),
                      TextButton(
                          onPressed: () {
                            navPushTransition(context, const LoginPage());
                          },
                          child: const Text("Sign in now")),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final firebase =
                                FirebaseService(FirebaseAuth.instance);
                            firebase.signUpEmail(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
                          }
                        },
                        child: const Text("Register")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
