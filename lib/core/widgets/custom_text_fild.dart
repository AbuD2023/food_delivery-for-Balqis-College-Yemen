import 'package:flutter/material.dart';
import 'package:food_delivery/core/constants/app_them.dart';

class CustomTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  const CustomTextFild({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.decoration,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration:
          decoration ??
          InputDecoration(
            hintText: hintText,
            // border: OutlineInputBorder(),
            filled: true,
            fillColor: AppTheme.shadow,
          ),
      validator: validator,
    );
  }
}
