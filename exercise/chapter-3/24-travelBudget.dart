import '../reads.dart';
import 'dart:io';

void main() {
  while (true) {
    print("Coin Convertion System: ");
    print("1 - Dolar");
    print("2 - Marco Alemao");
    print("3 - Libra Esterlina");
    print("4 - Cancel");
    print("Choose an option (1-4): ");

    String? choice = stdin.readLineSync();

    double qntMoney = 0.0;

    if (choice != "4") {
      qntMoney = readDouble("Write how much you want to convert: ");
    }

    double total;

    switch (choice) {
      case '1':
        total = qntMoney / 1.80;
        print("You will have ${total.toStringAsFixed(2)} dolars");
        break;
      case '2':
        total = qntMoney / 2.00;
        print("You will have ${total.toStringAsFixed(2)} marco alemao");
        break;
      case '3':
        total = qntMoney / 3.57;
        print("You will have ${total.toStringAsFixed(2)} libra esterlina");
        break;
      case '4':
        print("Canceled.");
        break;
      default:
        print("Invalid command, try again.");
    }

    if (choice == "4") {
      break;
    }
  }
}
