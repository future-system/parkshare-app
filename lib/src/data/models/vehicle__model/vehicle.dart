class Vehicle {
  Vehicle({
    required this.plate,
    required this.model,
    required this.brand,
    required this.color,
    required this.type,
    this.description,
  });

  final String plate;
  final String model;
  final String brand;
  final String color;
  final String type;
  final String? description;

  Map<String, dynamic> toMap() {
    return {
      'plate': plate,
      'model': model,
      'brand': brand,
      'color': color,
      'type': type,
      'description': description,
    };
  }
}