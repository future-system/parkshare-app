// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:parkshare_app/src/core/constants/design_system.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final Widget? suffix;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  const CustomFormField({
    required this.label,
    super.key,
    this.suffix,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, shadows: []),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          cursorColor: DesignSystem.colors.primary,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            isDense: true,
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            suffix: suffix,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
