// ignore_for_file: avoid_print

import 'package:shared_preferences/shared_preferences.dart';

class SharedServices {
  final keyEmail = 'email';

  Future<String?> getEmail() async {
    final pref = await SharedPreferences.getInstance();
    print("SUKSES GET EMAIL");
    return pref.getString(keyEmail);
  }

  Future<bool> saveEmail(String email) async {
    final pref = await SharedPreferences.getInstance();
    print("SUKSES SAVE EMAIL");
    return pref.setString(keyEmail, email);
  }

  Future<bool> deleteEmail() async {
    final pref = await SharedPreferences.getInstance();
    print("SUKSES DELETE EMAIL");
    return pref.remove(keyEmail);
  }
}
