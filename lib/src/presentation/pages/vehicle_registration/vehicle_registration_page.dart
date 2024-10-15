import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/core/navigation.dart';
import 'package:parkshare_app/src/data/models/vehicle_registration_model/vehicle_model.dart';
import 'package:parkshare_app/src/presentation/components/buttons/custom_button.dart';
import 'package:parkshare_app/src/presentation/components/vehicles/vehicle_info_box.dart';
import 'package:parkshare_app/src/presentation/components/vehicles/vehicles_info_tile.dart';

class VehicleRegistrationPage extends StatefulWidget {
  const VehicleRegistrationPage({super.key});

  @override
  State<VehicleRegistrationPage> createState() =>
      _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends State<VehicleRegistrationPage> {
  bool showModal = false;

  bool isEditing = false;

  final List<VehicleModel> vehicles = [];

  VehicleModel? currentVehicle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 500),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: vehicles
                          .map((vehicle) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: VehiclesInfoTile(
                                onDelete: () => setState(() {
                                  vehicles.remove(vehicles[vehicles.indexWhere((element) => element.plate == vehicle.plate)]);
                                }),
                                onEdit: () =>
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          Dialog(
                                            backgroundColor: Colors.transparent,
                                            insetPadding: EdgeInsets.zero,
                                            child: SingleChildScrollView(
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      24, 0, 24, 164),
                                                  child: VehicleInfoBox(
                                                    vehicle: vehicle,
                                                    onSaved: (vehicle) {
                                                      setState(() {
                                                        vehicles[vehicles
                                                            .indexWhere(
                                                                (element) =>
                                                            element.plate ==
                                                                vehicle
                                                                    .plate)] =
                                                            vehicle;
                                                        currentVehicle = null;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    ),
                                vehicle: vehicle,
                              ),
                            ),
                          ))
                          .toList(),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        onPressed: () {
                          setState(() {
                            currentVehicle = VehicleModel(
                                plate: "",
                                model: "",
                                brand: "",
                                color: "",
                                type: "");
                          });

                          showDialog(
                            context: context,
                            builder: (context) =>
                                Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: EdgeInsets.zero,
                                  child: SingleChildScrollView(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            24, 0, 24, 164),
                                        child: VehicleInfoBox(
                                          vehicle: currentVehicle!,
                                          onSaved: (vehicle) {
                                            setState(() {
                                              vehicles.add(vehicle);
                                              currentVehicle = null;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () async {
                          Navigator.pushNamed(
                              context, Navigation.routing.home);
                        },
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Navigation.routing.home);
                      },
                      child: Text(
                        'Não quero cadastrar agora',
                        style: TextStyle(color: DesignSystem.colors.secondary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
