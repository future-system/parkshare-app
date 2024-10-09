import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/data/models/vehicle_registration_model/vehicle_model.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/custom_form_field/custom_form_field.dart';

class VehicleInfoBox extends StatefulWidget {
  VehicleInfoBox({required this.vehicle, required this.onSaved, super.key});

  final VehicleModel vehicle;

  final Function(VehicleModel model) onSaved;

  @override
  State<VehicleInfoBox> createState() => _VehicleInfoBoxState();
}

class _VehicleInfoBoxState extends State<VehicleInfoBox> {
  late final TextEditingController plateController;
  late final TextEditingController modelController;
  late final TextEditingController brandController;
  late final TextEditingController colorController;
  late final TextEditingController typeController;

  @override
  void initState() {
    super.initState();

    plateController = TextEditingController(text: widget.vehicle.plate);
    modelController = TextEditingController(text: widget.vehicle.model);
    brandController = TextEditingController(text:  widget.vehicle.brand);
    colorController = TextEditingController(text:  widget.vehicle.color);
    typeController = TextEditingController(text:  widget.vehicle.type);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          color: DesignSystem.colors.secondary,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  hint: "Placa",
                  controller: plateController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hint: "Modelo",
                  controller: modelController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hint: "Marca",
                  controller: brandController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hint: "Cor",
                  controller: colorController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  hint: "Tipo",
                  controller: typeController,
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () async => widget.onSaved(VehicleModel(
                            plate: plateController.text,
                            model: modelController.text,
                            brand: brandController.text,
                            color: colorController.text,
                            type: typeController.text)),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
