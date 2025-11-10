import '../reads.dart';

void main() {
  double carPrice = readDouble("write the car valeu: ");

  List<double> carPriceTableWithTax = [];

  double carPriceCash;

  int percent = 3;
  int cont = 0;

  for (
    int installments = 6;
    installments <= 60;
    installments = installments + 6
  ) {
    double finalPrice = carPrice + (100 / percent + cont);
    carPriceTableWithTax.add(finalPrice);

    print(carPriceTableWithTax[cont].toStringAsFixed(2));

    cont += 1;
  }
}
