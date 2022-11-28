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
    bool isClicked = false;
    return Scaffold(
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
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                                    text: '\$${widget.gaji}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: light,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                  color: Color(0xff989BA1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // TODO MAIN FASILITIES
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // TODO PHOTO
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Photos',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: edge,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            Image.asset(
                              'assets/logo.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      // todo : location
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Location',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.lokasi,
                              style: greyTextStyle.copyWith(),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/admin.jpeg',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
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
                            'Book Now',
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(50),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.25),
                  //         spreadRadius: 5,
                  //         blurRadius: 7,
                  //         offset:
                  //             const Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ],
                  //   ),
                  //   child: IconButton(
                  //     icon: const Icon(Icons.arrow_back),
                  //     color: purpleColor,
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(50),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.25),
                  //         spreadRadius: 5,
                  //         blurRadius: 7,
                  //         offset:
                  //             const Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ],
                  //   ),
                  //   child: IconButton(
                  //     icon: const Icon(Icons.favorite),
                  //     color: orangeColor,
                  //     onPressed: () {},
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked ? 'assets/logo.png' : 'assets/ic_star.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
