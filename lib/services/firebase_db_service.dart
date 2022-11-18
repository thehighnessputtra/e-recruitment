import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FirebaseDBServices {
  var db = FirebaseFirestore.instance;

  Future addLoker({
    String? namaLoker,
    String? namaPerusahaan,
  }) async {
    var box = await Hive.openBox('userBox');
    var uid = box.get('uid');
    var email = box.get('email');
    var isiLoker = {
      "namaLoker": namaLoker,
      "namaPerusahaan": namaPerusahaan,
      "createdBy": email,
      "uidUser": uid,
    };

    var hasil = await db.collection('isiLoker').doc().set(isiLoker).then((value) {
      print('$namaLoker, $namaPerusahaan berhasil dibuat');
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getLoker(String uid) async {
    var hasil =
        await db.collection('isiLoker').where('uidUser', isEqualTo: uid).get();
    return hasil;
  }

  Future editLoker({
    required String uidLoker,
    String? namaLoker,
    String? namaPerusahaan,
  }) async {
    var isiLoker = {
      "namaLoker": namaLoker,
      "namaPerusahaan": namaPerusahaan,
    };
    var hasil = await db
        .collection('isiLoker')
        .doc(uidLoker)
        .update(isiLoker)
        .then((value) {
      print('$namaLoker, $namaPerusahaan berhasil di update');
    });
  }

  deleteLoker(uidLoker) async {
    var hasil = await db.collection('isiLoker').doc(uidLoker).delete();
  }
}
