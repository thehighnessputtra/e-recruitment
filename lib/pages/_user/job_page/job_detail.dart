import 'package:flutter/material.dart';
import 'package:latihan_firebase/style/theme.dart';

class JobDetailUser extends StatefulWidget {
  String tipePekerjaan;
  String namaPerusahaan;
  String namaLoker;
  String lokasi;
  String gaji;
  String urlLogo;
  String deskripsiPerusahaan;
  String deskripsiKualifikasi;
  String deskripsiKeahlian;

  JobDetailUser(
      {super.key,
      required this.tipePekerjaan,
      required this.namaPerusahaan,
      required this.namaLoker,
      required this.lokasi,
      required this.gaji,
      required this.urlLogo,
      required this.deskripsiPerusahaan,
      required this.deskripsiKualifikasi,
      required this.deskripsiKeahlian});

  @override
  State<JobDetailUser> createState() => _JobDetailUserState();
}

class _JobDetailUserState extends State<JobDetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              widget.urlLogo,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3)],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.namaLoker,
                              style: blackTextStyle.copyWith(
                                fontSize: 22,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'RP ${widget.gaji}',
                                style: purpleTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 20,
                                ),
                                Text(
                                  "${widget.namaPerusahaan}, ${widget.lokasi}",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: regular,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Deskripsi Perusahaan',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.deskripsiPerusahaan,
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Deskripsi Kualifikasi',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.deskripsiKualifikasi,
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Deskripsi Keahlian',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.deskripsiKeahlian,
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          onPressed: () {
                            // showConfirm();
                          },
                          child: Text(
                            'Lamar Pekerjaan',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // todo : button back dan favorite
          ],
        ),
      ),
    );
  }
}
