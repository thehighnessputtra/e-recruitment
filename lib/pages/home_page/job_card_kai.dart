// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class JobCardKAI extends StatefulWidget {
  const JobCardKAI({Key? key}) : super(key: key);

  @override
  State<JobCardKAI> createState() => _JobCardKAIState();
}

class _JobCardKAIState extends State<JobCardKAI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 200,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorBlueSecondKAI),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 60,
                            height: 60,
                            child:
                                CircleAvatar(backgroundColor: colorOrangeKAI)),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "OPERASIONAL DAN PEMELIHARAAN SARANA PRASARANA",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: size18.copyWith(
                                    fontWeight: fw600, color: colorWhiteKAI),
                              ),
                              Text(
                                "Lokasi • Indonesia",
                                style: size14.copyWith(
                                    color: colorWhiteKAI.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colorBlueKAI),
                          width: 44,
                          height: 44,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_add_outlined,
                                size: 30,
                                color: colorWhiteKAI,
                              )),
                        )
                      ],
                    ),
                    Divider(
                      color: colorWhiteSecondKAI,
                    ),
                    Text(
                      "Deskripsi : ",
                      style: size16.copyWith(
                          color: colorWhiteKAI, fontWeight: fw600),
                    ),
                    Text(
                      maxLines: 4,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      style: size14.copyWith(
                          color: colorWhiteSecondKAI.withOpacity(0.5)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
