import 'package:flutter/material.dart';
import 'package:food_delivery/core/constans/app_them.dart';

class CustomTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  const CustomTextFild({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
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
