class JobKAIModel {
  final int createAt;
  final String formasi;
  final String jenisKelamin;
  final String jurusan;
  final String ketentuanUmum;
  final String keterangan;
  final String kriteriaUmum;
  final String lokasi;
  final String pendidikan;
  final String prosedurSeleksi;
  final String syaratDokumen;
  final String tahapanSeleksi;
  final String urlPict;

  JobKAIModel(
      {required this.createAt,
      required this.formasi,
      required this.jenisKelamin,
      required this.jurusan,
      required this.ketentuanUmum,
      required this.keterangan,
      required this.kriteriaUmum,
      required this.lokasi,
      required this.pendidikan,
      required this.prosedurSeleksi,
      required this.syaratDokumen,
      required this.tahapanSeleksi,
      required this.urlPict});
}
