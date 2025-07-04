import 'package:flutter/material.dart';
import 'package:portfolio/core/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final double vertical;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.vertical = 0,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      cursorColor: Colors.white,
      style: TextStyles.regularTextStyle.copyWith(
        color: Colors.white,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: vertical,
        ),
        hintText: hintText,
        hintStyle: TextStyles.regularTextStyle.copyWith(
          color: Colors.white,
          fontSize: 12,
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
