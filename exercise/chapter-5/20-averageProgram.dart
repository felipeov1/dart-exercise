import '../reads.dart';

void main() {
  int option = 0;

  do {
    print("1. Arithmetic Average");
    print("2. Weighted Average");
    print("3. Exit");
    int option = readInt("Chose an option: ");

  
    switch (option) {
      case 1:
        double n1 = readDouble("Write the first grade: ");
        double n2 = readDouble("Write the second grade: ");
        double average = (n1 + n2) / 2;
        print("The arithmetic average is ${average.toStringAsFixed(2)}");
        break;

      case 2:
        double n1 = readDouble("Write the first grade: ");
        double w1 = readDouble("Write the first grade's weight: ");

        double n2 = readDouble("Write the second grade: ");
        double w2 = readDouble("Write 'the second grade's weight: ");

        double n3 = readDouble("Write the third grade: ");
        double w3 = readDouble("Write the third grade's weight: ");

        double numerator = (n1 * w1) + (n2 * w2) + (n3 * w3);
        double denominator = w1 + w2 + w3;

        if (denominator != 0) {
          double weightedAverage = numerator / denominator;
          print(
            "The weighted average is ${weightedAverage.toStringAsFixed(2)}",
          );
          print("The sum of the weights can't be zero.");
        }
        break;

      case 3:
        print("Program finished");
        break;

      default:
        print("Choose 1, 2, or 3.");
    }
  } while (option != 3);
}
