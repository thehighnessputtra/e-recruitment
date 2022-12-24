import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class CustomDropdownField extends StatelessWidget {
  final List listItem;
  final String hint;
  final ValueChanged? onChanged;
  const CustomDropdownField(
      {super.key, required this.listItem, required this.hint, this.onChanged});

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
        // value: value,
        hint: Text(
          hint,
          style: size16.copyWith(color: Colors.grey.withOpacity(0.8)),
        ),
        items: listItem
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
