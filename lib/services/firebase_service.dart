// ignore_for_file: unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/pages/auth/login_page.dart';
import 'package:latihan_firebase/pages/navbar/navbottom_bar.dart';
import 'package:latihan_firebase/services/sharedpref_service.dart';
import 'package:latihan_firebase/widget/dialog_widget.dart';
import 'package:latihan_firebase/widget/transition_widget.dart';

class FirebaseService {
  final FirebaseAuth auth;

  FirebaseService(this.auth);
  final pref = SharedServices();
  User get user => auth.currentUser!;
  bool isLoading = false;

  Stream<User?> get authState => auth.authStateChanges();

  Future<void> signUpEmail(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, name)});

      // ignore: use_build_context_synchronously
      authRoute(context, "Register success!", const LoginPage());
    } on FirebaseAuthException catch (e) {
      dialogInfo(context, "Email sudah digunakan!", 2);
    }
  }

  Future<void> signInEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      pref.saveEmail(email);

      // ignore: use_build_context_synchronously
      authRoute(context, "Login success!", const NavBottomBarUser());
    } on FirebaseAuthException catch (e) {
      // dialogInfo(context, e.message!);
      if (e.message ==
          "The password is invalid or the user does not have a password.") {
        return dialogInfo(context, "Password salah!", 2);
      } else {
        return dialogInfo(context, "Email tidak terdaftar!", 2);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      pref.deleteEmail();
      // ignore: use_build_context_synchronously
      authRoute(context, "Logout success!", const LoginPage());
    } on FirebaseAuthException catch (e) {
      dialogInfo(context, e.message!, 2);
    }
  }

  authRoute(context, String text, Widget page) {
    dialogInfo(context, text, 2);
    Future.delayed(
      const Duration(seconds: 2),
      () => navReplaceTransition(context, page),
    );
  }

  postDetailsToFirestore(String email, String name) async {
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.email).set({
      'email': email,
      'role': "User",
      'name': name,
      'cvName': "Masukan CV anda!",
      'about': "Masukan info tentang anda!",
      'avatarUrl':
          "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/avatar%2Fadmin.jpeg?alt=media&token=5dfe6346-be26-46d0-9fa2-a0cd7148fe77",
      'cvURL':
          "https://firebasestorage.googleapis.com/v0/b/latihan-firebase-yogi.appspot.com/o/cv%2FSILAHKAN%20INPUT%20CV%20ANDA.pdf?alt=media&token=00531920-3c28-417f-b9f8-8940e6c15e36"
    });
  }
}
