import '../reads.dart';

void main() {
  double price = readDouble("Enter the product price: R\$ ");
  int originCode = readInt("Enter the origin code: ");

  String originName = "";

  if (originCode == 1) {
    originName = "Sul";
  } else if (originCode == 2) {
    originName = "Norte";
  } else if (originCode == 3) {
    originName = "Leste";
  } else if (originCode == 4) {
    originName = "Oeste";
  } else if (originCode == 5 || originCode == 6) {
    originName = "Nordeste";
  } else if (originCode >= 7 && originCode <= 9) {
    originName = "Sudeste";
  } else if (originCode >= 10 && originCode <= 20) {
    originName = "Centro-oeste";
  } else if (originCode >= 21 && originCode <= 30) {
    originName = "Nordeste";
  } else {
    originName = "Invalid Code";
  }

  print("The product origin is: $originName");
}