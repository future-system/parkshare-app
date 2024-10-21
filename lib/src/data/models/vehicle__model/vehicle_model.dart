import 'package:parkshare_app/src/data/models/vehicle__model/vehicle.dart';

class VehicleModel {
  VehicleModel({required this.vehicles});

  final List<Vehicle> vehicles;

  Map<String, dynamic> toMap() {
    return {'vehicles': vehicles.map((vehicle) => vehicle.toMap()).toList(),};
  }
}