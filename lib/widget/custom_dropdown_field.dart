import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class CustomDropdownField extends StatelessWidget {
  final List listItem;
  final String hint;
  const CustomDropdownField(
      {super.key, required this.listItem, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<dynamic>(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
        ),
        hint: Text(
          hint,
          style: size16.copyWith(color: Colors.grey.withOpacity(0.8)),
        ),
        items: listItem
            .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }
}
