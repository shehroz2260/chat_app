import 'package:flutter/material.dart';
import '../utils/app_style.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double? width;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.width,
      this.controller,
      this.validator,
      this.keyboardType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      color: const Color(0xffF7F7FC),
      child: TextFormField(
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "  $hintText",
          hintStyle: AppStyle.fontStyle16,
        ),
      ),
    );
  }
}
