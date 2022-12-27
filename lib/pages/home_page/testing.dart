import 'package:flutter/material.dart';
import 'package:latihan_firebase/widget/news_card_widget.dart';

class TestingAPI extends StatefulWidget {
  const TestingAPI({super.key});

  @override
  State<TestingAPI> createState() => _TestingAPIState();
}

class _TestingAPIState extends State<TestingAPI> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //     appBar: AppBar(),
        //     body: SingleChildScrollView(
        //       padding: const EdgeInsets.all(12),
        //       child:
        Column(
      children: const [
        NewsCard(
            title: "MASINIS",
            subtitle:
                "MASINIS adalah pegawai yang bertugas mengoperasikan kereta api dan langsiran serta sebagai pemimpin selama dalam perjalanan kereta api. Kata 'MASINIS' berasal dari bahasa Belanda machinist yang sebenarnya berarti juru mesin. Disebut masinis karena pada awalnya juru mesinlah yang menjalankan kereta api. Sedangkan Asisten Masinis adalah pegawai yang bertugas membantu masinis dalam mengoperasikan kereta api dan langsiran.",
            urlImage:
                "https://blog-media.lifepal.co.id/wp-content/uploads/2018/06/29102516/Gaji-Masinis-Sekarang-Udah.jpg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "PENGATUR PERJALANAN KERETA API (PPKA)",
            subtitle:
                "Pengatur Perjalanan Kereta Api (PPKA) merupakan pekerjaan seorang profesional yang membutuhkan keahlian khusus dan kedisiplinan tinggi yang bertanggung jawab mengatur dan melakukan segala tindakan untuk menjamin keselamatan dan ketertiban berikut segala sesuatu yang berkaitan dengan urusan perjalanan kereta api dan urusan langsir dalam batas stasiunnya untuk wilayah pengaturan setempat atau beberapa stasiun untuk wilayah pengaturan daerah.",
            urlImage:
                "https://topcareer.id/wp-content/uploads/2019/08/cropped-masiniscomm-1024x575.jpg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "KONDEKTUR",
            subtitle:
                "Kondektur adalah pegawai yang diserahi tugas membantu masinis dalam urusan perjalanan kereta api dan urusan langsir bilamana di stasiun tersebut tidak ada juru langsir, serta mengkoordinasikan pelaksanaan tugas petugas lain di dalam kereta api.",
            urlImage:
                "https://1.bp.blogspot.com/-f0XWZgzGvCw/Xpl7nz4OXSI/AAAAAAAACCA/XpyvqHDDzXsIR1oVx1UGaJ9yQt6y2ARswCLcBGAsYHQ/s1600/Apa%2BSaja%2BPersiapan%2BUntuk%2BMenjadi%2BSeorang%2BKondektur.jpg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "TEKNISI SARANA",
            subtitle:
                "Teknisi Sarana Perkeretaapian adalah petugas yang melaksanakan pemeriksaan dan perawatan sarana kereta api beserta komponen pendukung dan perlengkapannya. Pemeriksaan sarana kereta api dilakukan untuk mengetahui/memastikan kondisi dan fungsi sarana. Sedangkan, perawatan sarana meliputi perawatan berkala dan perbaikan untuk mengembalikan fungsinya.",
            urlImage:
                "https://bumntrack.co.id/wp-content/uploads/2020/09/WhatsApp-Image-2020-09-17-at-18.24.56.jpeg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "TEKNISI JALAN REL DAN JEMBATAN",
            subtitle:
                "Teknisi Jalan Rel Dan Jembatan adalah pekerjaan yang tidak kalah pentingnya dalam keselamatan dan kelancaran perjalanan kereta api, pekerjaan ini memelihara jalan rel (bangunan atas/bawah) berikut segala peralatannya, perlengkapannya, sehingga tiap-tiap bagiannya dapat dengan aman dilalui dengan kecepatan puncak yang telah ditentukan.",
            urlImage:
                "https://awsimages.detik.net.id/community/media/visual/2020/09/05/petugas-pemerika-jalur-rel-kereta-api.jpeg?w=700&q=90"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "PETUGAS NEGATIVE CHECK (PNC) SINTELIS/LISTRIK ALIRAN ATAS",
            subtitle:
                "Petugas Negative Check Sinyal, Telekomunikasi dan Listrik (PNC Sintelis) bertugas melakukan pemeriksaan dan perawatan peralatan sinyal, telekomunikasi, dan administrasi meliputi perawatan berkala, tidak berkala, korektif, dan lainnya. Hal ini untuk menjaga agar peralatan sinyal dan telekomunikasi kereta api tetap andal dan dalam kondisi yang baik.",
            urlImage:
                "https://disk.mediaindonesia.com/thumbs/1800x1200/news/2020/10/ef06cf447b09310d00e3b11e63c62378.jpg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "POLISI KHUSUS KERETA API",
            subtitle:
                "Polisi Khusus Kereta Api yang selanjutnya disebut Polsuska adalah instansi dan/atau badan pemerintah yang melaksanakan fungsi Kepolisian di bidang Kereta Api. Polsuska ini  bertugas melaksanakan pengamanan, pencegahan, penangkalan, dan penindakan nonyustisiil sesuai dengan bidang teknisnya masing-masing yang diatur dalam peraturan perundang-undangan yang menjadi dasar hukumnya di bidang perkeretaapian serta melaksanakan penertiban di atas kereta api, di stasiun dan di seluruh asset perusahaan termasuk jalur kereta api.",
            urlImage: "https://pbs.twimg.com/media/DgrCvsjUYAABeq7.jpg"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "OPERATOR KENDARAAN PERAWATAN JALAN REL",
            subtitle:
                "Operator Kendaraan Perawatan Jalan Rel (KPJR) bertugas mengoperasikan KPJR yang merupakan salah satu alat berat di dunia perkeretaapian yang berfungsi untuk melakukan perawatan jalan rel dengan cara memadatkan batu-batu yang ada di bawah bantalan (ballast) atau kricak. Batu ballast itu akan dipadatkan oleh tamping unit yang ada di kereta tersebut. KPJR juga berfungsi memperbaiki keselarasan rel untuk membuatnya tetap sejajar, mudah dilewati kereta penumpang dan barang, serta mengurangi tekanan mekanik pada rel terhadap kereta yang lewat. ",
            urlImage:
                "https://awsimages.detik.net.id/community/media/visual/2019/12/18/ddcf7aaa-b9b9-4409-9bdf-1af59bc94e9c.jpeg?w=700&q=90"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "PETUGAS LANGSIR/PETUGAS RUMAH SINYAL (PLR/PRS)",
            subtitle:
                "Petugas Langsir (PLR) bertugas memandu pergerakan rangkaian kereta, gerbong, atau hanya lokomotif untuk berpindah jalur rel. Perpindahan jalur terutama diperlukan untuk memisahkan atau merangkaikan kereta atau gerbong.",
            urlImage: "https://pbs.twimg.com/media/EbPEn-jUcAApwwY.jpg:large"),
        SizedBox(
          height: 10.0,
        ),
        NewsCard(
            title: "TEKNISI WORKSHOP DEPO MEKANIK JALAN REL & JEMBATAN",
            subtitle:
                "Teknisi Workshop Depo Mekanik Jalan Rel & Jembatan bertugas dalam pemeriksaan dan perawatan kendaraan perawatan jalan rel (KPJR) beserta komponen pendukung dan perlengkapannya. Pemeriksaan kendaraan perawatan jalan rel (KPJR) dilakukan untuk mengetahui/memastikan kondisi dan fungsi kendaraan perawatan jalan rel (KPJR) serta melakukan pemeliharaan dan perbaikan terhadap peralatan untuk perawatan jalan rel dan jembatan.",
            urlImage:
                "https://cdn-2.tstatic.net/jabar/foto/bank/images/nataru-daop.jpg"),
        SizedBox(
          height: 10.0,
        ),
        // NewsCard(
        //   urlImage:
        //       "https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/06/6274b6f4b003c-krl-solo-yogyakarta_665_374.jpg",
        //   title: "Libur Nataru, KRL Solo-Yogya Tambah 6 Operasional Pelayanan",
        //   subtitle:
        //       "KAI Commuter sebagai operator Commuterline dan KA Lokal di beberapa wilayah siap menyukseskan agenda angkutan Nataru tahun ini dari 19 Desember 2022 hingga 3 Januari 2022",
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
        // NewsCard(
        //   urlImage:
        //       "https://paultan.org/image/2022/12/Jean-Todt-UN-Special-Envoy-Road-Safety-BM-1200x631.jpg",
        //   title:
        //       "Semua jenama kereta perlu bersetuju dengan standard keselamatan minimum – Jean Todt beri pandangan",
        //   subtitle:
        //       "Duta khas setiausaha agung PBB untuk keselamatan jalan raya, Jean Todt menyatakan bahawa satu perjanjian di antara semua pengeluar kenderaan berkenaan standard keselamatan minimum untuk semua kenderaan baru yang dijual, boleh menjadi tonggak penting untuk asp…",
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
        // NewsCard(
        //   urlImage:
        //       "https://thumb.viva.co.id/media/frontend/thumbs3/2022/12/22/63a3fbca63289-ilustrasi-bayi-pakai-bando-bandana-headband_665_374.jpg",
        //   title:
        //       "Aksesori Kepala Si Kecil Bikin Gemas, Perawat Anak Ini Ungkap Bahayanya",
        //   subtitle:
        //       "Menjelang Natal, tak sedikit orangtua yang ingin menunjukkan tampilan gemas dari anak dengan sebuah aksesori kepala, salah satunya bandana. Tapi, ada bahaya mengintai.",
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
        // NewsCard(
        //   urlImage:
        //       "https://paultan.org/image/2021/01/Modenas-Elegan-250-ABS-2020-Feat-BM-1-1200x629.jpg",
        //   title:
        //       "Penunggang motosikal patut beralih ke pengangkutan awam; paling bahaya kepada paling selamat – MIROS",
        //   subtitle:
        //       "Dalam satu sidang media yang diadakan semalam, pengerusi Institut Penyelidikan Keselamatan Jalan Raya Malaysia (MIROS), Wong Shaw Voon menyatakan harapan supaya penunggang motosikal di Malaysia dapat beralih kepada pengangkutan awam untuk pergerakan harian. ",
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
      ],
      // ),
      // )
    );
  }
}
