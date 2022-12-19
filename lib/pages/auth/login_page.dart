import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_firebase/services/firebase_service.dart';
import 'package:latihan_firebase/services/sharedpref_service.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';
import '../navbar/navbottom_bar.dart';
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
  bool _hidePassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 220,
                  ),
                  Center(
                    child: Text(
                      "Sign In",
                      style: mediumSize.copyWith(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Text(
                        "Email ",
                        style: mediumSize.copyWith(fontSize: 14),
                      ),
                      Text(
                        "*",
                        style:
                            mediumSize.copyWith(color: redColor, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    key: const Key("Input email"),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      String msg =
                          r"[a-z0-9!#%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
                      if (value!.isEmpty) {
                        return 'Email can not be empty';
                      }
                      if (!RegExp(msg).hasMatch(value)) {
                        return 'Email is invalid';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _emailController.text = value!;
                    },
                    decoration: InputDecoration(
                        errorStyle: mediumSize.copyWith(color: Colors.red),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: blackColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: blackColor)),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        hintText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Password ",
                        style: mediumSize.copyWith(fontSize: 14),
                      ),
                      Text(
                        "*",
                        style:
                            mediumSize.copyWith(color: redColor, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    key: const Key("Input password"),
                    controller: _passwordController,
                    obscureText: !_hidePassword,
                    validator: (value) {
                      String msg = '.{8,}';
                      if (value!.isEmpty) {
                        return 'Password can not be empty';
                      }
                      if (!RegExp(msg).hasMatch(value)) {
                        return 'Password length can’t be less than 5 char';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: blackColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: blackColor)),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                        hintText: ("Password"),
                        floatingLabelBehavior: FloatingLabelBehavior.always),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have a account?", style: mediumSize),
                      TextButton(
                          onPressed: () {
                            navReplaceTransition(context, const RegisterPage());
                          },
                          child: const Text("Sign up now")),
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
                            firebase.signInEmail(
                                email: _emailController.text,
                                password: _passwordController.text,
                                context: context);
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
}
