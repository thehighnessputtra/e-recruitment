import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latihan_firebase/utils/constant.dart';
import 'package:latihan_firebase/view_model/news_api_view_model.dart';
import 'package:latihan_firebase/widget/news_card_widget.dart';
import 'package:provider/provider.dart';

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
      children: [
        NewsCard(
          urlImage:
              "https://thumb.viva.co.id/media/frontend/thumbs3/2022/05/06/6274b6f4b003c-krl-solo-yogyakarta_665_374.jpg",
          title: "Libur Nataru, KRL Solo-Yogya Tambah 6 Operasional Pelayanan",
          subtitle:
              "KAI Commuter sebagai operator Commuterline dan KA Lokal di beberapa wilayah siap menyukseskan agenda angkutan Nataru tahun ini dari 19 Desember 2022 hingga 3 Januari 2022",
        ),
        const SizedBox(
          height: 10.0,
        ),
        NewsCard(
          urlImage:
              "https://paultan.org/image/2022/12/Jean-Todt-UN-Special-Envoy-Road-Safety-BM-1200x631.jpg",
          title:
              "Semua jenama kereta perlu bersetuju dengan standard keselamatan minimum – Jean Todt beri pandangan",
          subtitle:
              "Duta khas setiausaha agung PBB untuk keselamatan jalan raya, Jean Todt menyatakan bahawa satu perjanjian di antara semua pengeluar kenderaan berkenaan standard keselamatan minimum untuk semua kenderaan baru yang dijual, boleh menjadi tonggak penting untuk asp…",
        ),
        const SizedBox(
          height: 10.0,
        ),
        NewsCard(
          urlImage:
              "https://thumb.viva.co.id/media/frontend/thumbs3/2022/12/22/63a3fbca63289-ilustrasi-bayi-pakai-bando-bandana-headband_665_374.jpg",
          title:
              "Aksesori Kepala Si Kecil Bikin Gemas, Perawat Anak Ini Ungkap Bahayanya",
          subtitle:
              "Menjelang Natal, tak sedikit orangtua yang ingin menunjukkan tampilan gemas dari anak dengan sebuah aksesori kepala, salah satunya bandana. Tapi, ada bahaya mengintai.",
        ),
        const SizedBox(
          height: 10.0,
        ),
        NewsCard(
          urlImage:
              "https://paultan.org/image/2021/01/Modenas-Elegan-250-ABS-2020-Feat-BM-1-1200x629.jpg",
          title:
              "Penunggang motosikal patut beralih ke pengangkutan awam; paling bahaya kepada paling selamat – MIROS",
          subtitle:
              "Dalam satu sidang media yang diadakan semalam, pengerusi Institut Penyelidikan Keselamatan Jalan Raya Malaysia (MIROS), Wong Shaw Voon menyatakan harapan supaya penunggang motosikal di Malaysia dapat beralih kepada pengangkutan awam untuk pergerakan harian. ",
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
      // ),
      // )
    );
  }
}
