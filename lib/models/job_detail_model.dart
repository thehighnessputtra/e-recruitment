class JobDetailModel {
  final String tipePekerjaan;
  final String namaPerusahaan;
  final String namaLoker;
  final String lokasi;
  final String gaji;
  final String urlLogo;
  final String deskripsiPerusahaan;
  final String deskripsiKualifikasi;
  final String deskripsiKeahlian;

  JobDetailModel(
      {required this.tipePekerjaan,
      required this.urlLogo,
      required this.namaPerusahaan,
      required this.namaLoker,
      required this.lokasi,
      required this.gaji,
      required this.deskripsiPerusahaan,
      required this.deskripsiKualifikasi,
      required this.deskripsiKeahlian});
}
