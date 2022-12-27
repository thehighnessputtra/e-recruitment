import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const CustomButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: colorBlueSecondKAI),
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
