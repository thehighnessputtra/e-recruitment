import 'package:cloud_firestore/cloud_firestore.dart';

class LokerModels {
  int? id;
  String? namaLoker;
  String? namaPerusahaan;
  String? tipePekerjaan;
  String? lokasi;
  int? gaji;
  DateTime? dibuatTanggal;
  String? deskripsiKualifikasi;
  String? deskripsiKeahlian;
  String? deskripsiBebas;

  LokerModels(
      {this.id,
      required this.namaLoker,
      required this.namaPerusahaan,
      required this.tipePekerjaan,
      required this.lokasi,
      required this.gaji,
      required this.dibuatTanggal,
      required this.deskripsiBebas,
      required this.deskripsiKeahlian,
      required this.deskripsiKualifikasi});

  Map<String, dynamic> toJson() => {
        'id': id,
        'namaLoker': namaLoker,
        'namaPerusahaan': namaPerusahaan,
        'tipePekerjaan': tipePekerjaan,
        'lokasi': lokasi,
        'gaji': gaji,
        'dibuatTanggal': dibuatTanggal,
        'deskripsiKualifikasi': deskripsiKualifikasi,
        'deskripsiKeahlian': deskripsiKeahlian,
        'deskripsiBebas': deskripsiBebas
      };

  LokerModels fromJson(Map<String, dynamic> json) => LokerModels(
      id: json['id'],
      namaLoker: json['namaLoker'],
      namaPerusahaan: json['namaPerusahaan'],
      tipePekerjaan: json['tipePekerjaan'],
      lokasi: json['lokasi'],
      gaji: json['gaji'],
      dibuatTanggal: (json['dibuatTanggal'] as Timestamp).toDate(),
      deskripsiBebas: json['deskripsiBebas'],
      deskripsiKeahlian: json['deskripsiKeahlian'],
      deskripsiKualifikasi: json['deskripsiKualifikasi']);
}
