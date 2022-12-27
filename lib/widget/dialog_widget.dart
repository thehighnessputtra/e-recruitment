import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

void dialogInfo(BuildContext context, String text, int durationDelay) async {
  Future.delayed(Duration(seconds: durationDelay), () {
    Navigator.pop(context);
  });
  await showDialog<void>(
    context: context,
    // barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: size16,
        ),
      );
    },
  );
}

void dialogInfoWithoutDelay(BuildContext context, String text) async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      );
    },
  );
}

void dialogWarning(BuildContext context, String text) async {
  await showDialog<void>(
    context: context,
    barrierColor: Colors.red.withOpacity(0.8),
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        title: const Text(
          "WARNING!!!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        content: Text(
          text,
          style: size14,
        ),
      );
    },
  );
}

void dialogValidasi(
    BuildContext context, String text, VoidCallback child) async {
  await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          actions: [
            Row(children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: child,
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: const Text("No"),
                  ),
                ),
              ),
            ])
          ]);
    },
  );
}

futureDelayNavBack(BuildContext context, int duration) {
  Future.delayed(Duration(seconds: duration), () {
    Navigator.pop(context);
  });
}
