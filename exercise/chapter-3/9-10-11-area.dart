import 'dart:io';
import '../reads.dart';

double calculateTrapezeArea(
  double smallerBase,
  double largerBase,
  double height,
) {
  return ((smallerBase + largerBase) * height) / 2;
}

double calculateSquareArea(double side) {
  return side * side;
}

double calculateLosangeArea(double majorDiagonal, double minorDiagonal) {
  return (majorDiagonal * minorDiagonal) / 2;
}

void main() {
  while (true) {
    print(
      "Which shape do you want to calculate the area for?\n"
      "1. Trapeze\n"
      "2. Square\n"
      "3. Losange\n"
      "write - quit to exit.\n"
      "write the number corresponding to your choice: ",
    );

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        double largerBase = readDouble("write the length of the larger base: ");
        double smallerBase = readDouble(
          "write the length of the smaller base: ",
        );
        double height = readDouble("write the height: ");

        double trapezeArea = calculateTrapezeArea(
          smallerBase,
          largerBase,
          height,
        );

        print("The area of the trapeze is: $trapezeArea");
        break;
      case '2':
        double side = readDouble("write the length of the side: ");
        double squareArea = calculateSquareArea(side);
        print("The area of the square is: $squareArea");
        break;
      case '3':
        double majorDiagonal = readDouble(
          "write the length of the major diagonal: ",
        );
        double minorDiagonal = readDouble(
          "write the length of the minor diagonal: ",
        );
        double losangeArea = calculateLosangeArea(majorDiagonal, minorDiagonal);
        print("The area of the losange is: $losangeArea");
        break;
      case 'quit':
        print("Exiting the program.");
        break;
      default:
        print("Invalid choice. Please write 1, 2, 3, or 'quit'.");
    }

    if (choice == 'quit') {
      break;
    }
  }
}
