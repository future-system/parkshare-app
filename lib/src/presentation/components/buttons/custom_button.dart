// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color foregroundColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            DesignSystem.colors.primary,
          ),
          foregroundColor: WidgetStateProperty.all(foregroundColor),
        ),
        onPressed: onPressed,
        child: child);
  }
}
