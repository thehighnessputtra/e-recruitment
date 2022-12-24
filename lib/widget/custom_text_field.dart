import 'package:flutter/material.dart';
import 'package:latihan_firebase/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  final int maxLine;
  final String hintText;
  final TextEditingController controllerName;
  final VoidCallback? onPress;
  final FormFieldValidator? validasi;
  final bool isReadOnly;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.maxLine,
      required this.controllerName,
      this.onPress,
      this.validasi,
      required this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          controller: controllerName,
          readOnly: isReadOnly,
          maxLines: maxLine,
          onTap: onPress,
          validator: validasi,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
            hintStyle: size16.copyWith(color: Colors.grey.withOpacity(0.8)),
            prefixIconColor: Colors.grey.withOpacity(0.8),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5))),
          )),
    );
  }
}
