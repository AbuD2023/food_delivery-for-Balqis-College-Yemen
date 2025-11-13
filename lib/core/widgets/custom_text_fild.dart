import 'package:flutter/material.dart';
import 'package:food_delivery/core/constans/app_them.dart';

class CustomTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  const CustomTextFild({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        // border: OutlineInputBorder(),
        filled: true,
        fillColor: AppTheme.shadow,
      ),
      validator: validator,
    );
  }
}
