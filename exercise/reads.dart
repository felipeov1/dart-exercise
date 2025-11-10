import 'dart:io';

double readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);

    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? "");

    if (value != null) {
      return value;
    } else {
      print("Invalid input. Please write a number.");
    }
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);

    String? input = stdin.readLineSync();
    int? value = int.tryParse(input ?? "");

    if (value != null) {
      return value;
    } else {
      print("Invalid input. Please write an integer.");
    }
  }
}

String readString(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync();
  return input ?? "";
}
