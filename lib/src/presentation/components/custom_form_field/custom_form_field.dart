// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:parkshare_app/src/core/constants/design_system.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final Widget? suffix;
  const CustomFormField({
    super.key,
    required this.label,
    this.suffix,
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
            style: TextStyle(fontSize: 16, shadows: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.grey.shade600,
                offset: const Offset(0, 3),
              )
            ]),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              color: DesignSystem.colors.background,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.shade600,
                  offset: const Offset(0, 6),
                )
              ],
              border: Border.all(
                color: DesignSystem.colors.primary,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            cursorColor: DesignSystem.colors.primary,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: suffix,
            ),
          ),
        ),
      ],
    );
  }
}
