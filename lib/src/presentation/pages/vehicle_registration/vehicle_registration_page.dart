import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';

class VehicleRegistrationPage extends StatelessWidget {
  const VehicleRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: DesignSystem.colors.background,
        title: const Text(
          'Cadastre seu veículo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
