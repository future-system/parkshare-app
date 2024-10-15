import 'package:flutter/material.dart';
import 'package:parkshare_app/src/core/constants/design_system.dart';
import 'package:parkshare_app/src/data/models/vehicle_registration_model/vehicle_model.dart';

class VehiclesInfoTile extends StatefulWidget {
  const VehiclesInfoTile({required this.vehicle, required this.onDelete, required this.onEdit, super.key});

  final VehicleModel vehicle;

  final VoidCallback onDelete;

  final VoidCallback onEdit;

  @override
  State<VehiclesInfoTile> createState() => _VehiclesInfoTileState();
}

class _VehiclesInfoTileState extends State<VehiclesInfoTile> {
  final bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          decoration: BoxDecoration(
            color: DesignSystem.colors.secondary,
            borderRadius: BorderRadius.circular(16)
          ),          
          child: Row(
            children: [
              Text(widget.vehicle.model, style: const TextStyle(color: Colors.white)),
              const SizedBox(
                width: 8,
              ),
              Text(widget.vehicle.brand, style: const TextStyle(color: Colors.white)),
              const SizedBox(
                width: 8,
              ),
              Text(widget.vehicle.color, style: const TextStyle(color: Colors.white)),
              const Spacer(),
              IconButton(icon: const Icon(Icons.delete, color:  Colors.amber, size: 24,), onPressed: widget.onDelete,),
              const SizedBox(
                width: 8,
              ),
              IconButton(icon: const Icon(Icons.edit, color:  Colors.amber, size: 24,), onPressed: widget.onEdit,),
            ],
          ),
        ),

      ],
    );
  }
}
