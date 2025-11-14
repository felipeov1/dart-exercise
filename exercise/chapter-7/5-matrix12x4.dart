import '../../practices/reads.dart';

String monthConverter(numberMonth) {
  switch (numberMonth) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "October";
    case 11:
      return "November";
    case 12:
      return "December";
    default:
      return "Invalid Month Number";
  }
}

void main() {
  int rowSize = 12;
  int columnSize = 4;

  List<List<double>> sales = [];

  List<double> totalSalesPerMonth = [];

  for (int row = 0; row < rowSize; row++) {
    sales.add([]);
    totalSalesPerMonth.add(0.0);

    for (int column = 0; column < columnSize; column++) {
      double sale = readDouble(
        "write the sale of week ${column + 1} of month ${row + 1}: ",
      );

      sales[row].add(sale);
      totalSalesPerMonth[row] = totalSalesPerMonth[row] + sale;
    }
  }

  double totalSalesYear = 0.0;
  for (int i = 0; i < totalSalesPerMonth.length; i++) {
    print("Summary of ${monthConverter(i + 1)}: ");
    print("Total sales: ${totalSalesPerMonth[i].toStringAsFixed(2)}");

    for (int j = 0; j < columnSize; j++) {
      print(
        "Week ${j + 1} sales: ${sales[i][j].toStringAsFixed(2)}",
      ); // estudar...
    }
    totalSalesYear = totalSalesYear + totalSalesPerMonth[i];
  }
  print("Total sales in the year: ${totalSalesYear.toStringAsFixed(2)}");
}
