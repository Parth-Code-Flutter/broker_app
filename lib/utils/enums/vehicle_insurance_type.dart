enum VehicleInsuranceType {
  car,
  twoWheeler,
  commercial;

  String get string {
    switch (this) {
      case VehicleInsuranceType.car:
        return 'Car Insurance';
      case VehicleInsuranceType.twoWheeler:
        return 'Two Wheeler Insurance';
      case VehicleInsuranceType.commercial:
        return 'Commercial Insurance';
    }
  }
}
