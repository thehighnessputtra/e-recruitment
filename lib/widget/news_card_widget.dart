import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String urlImage;
  const NewsCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorBlueKAI.withOpacity(0.1),
        borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(15), right: Radius.circular(10)),
      ),
      height: 110,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(15)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(urlImage))),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: size16.copyWith(fontWeight: fw600),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        size12.copyWith(color: Colors.black.withOpacity(0.5)),
                    subtitle),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
