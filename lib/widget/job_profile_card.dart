import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class JobProfileCard extends StatelessWidget {
  const JobProfileCard(
      {super.key, required this.urlImage, required this.jobName});

  final String urlImage;
  final String jobName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(urlImage), fit: BoxFit.cover)),
          width: 100,
          height: 120,
        ),
        Positioned(
          top: 95,
          child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 25,
              color: Colors.white.withOpacity(0.8),
              child: Text(
                jobName,
                style: mediumSize.copyWith(fontWeight: FontWeight.w600),
              )),
        )
      ]),
    );
  }
}
