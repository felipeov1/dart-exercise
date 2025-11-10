import '../reads.dart';

class Car {
  String plate;
  int manufactureYear;

  Car({required this.plate, required this.manufactureYear});

  double calculateTax(int currentYear) {
    int yearsOfUse = currentYear - manufactureYear;
    if (yearsOfUse < 0) {
      return 0.0;
    }

    if (yearsOfUse == 0) {
      return 500.0;
    }

    if (yearsOfUse >= 10) {
      return 0.0;
    }

    double calculatedTax = 500.0 - (yearsOfUse * 100.0);

    if (calculatedTax < 100.0) {
      return 100.0;
    }

    return calculatedTax;
  }
}

void main() {
  List<Car> carList = [];

  print("register 5 cars:");
  for (int i = 0; i < 5; i++) {
    print("--- Registering Car ${i + 1} of 5 ---");
    String plate = readString("write the car plate:");
    int year = readInt("write the manufacture year:");

    Car newCar = Car(plate: plate, manufactureYear: year);
    carList.add(newCar);
    print("Car ${newCar.plate} registered.");
  }

  print("--- Tax Calculation ---");
  int currentYear = readInt("Write the current year for calculation:");

  print("--- tax for $currentYear ---");

  double totalTax = 0.0;
  int taxFreeCars = 0;

  for (var car in carList) {
    double tax = car.calculateTax(currentYear);

    print(
      "Car ${car.plate} (Year: ${car.manufactureYear}) -> Tax: R\$ ${tax.toStringAsFixed(2)}",
    );

    totalTax = totalTax + tax;

    if (tax == 0.0) {
      taxFreeCars = taxFreeCars + 1;
    }
  }

  print("b) Total tax for all cars: R\$ ${totalTax.toStringAsFixed(2)}");
  print("c) Number of tax-free cars: $taxFreeCars");
}
