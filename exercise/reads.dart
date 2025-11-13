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

DateTime readDate(String prompt) {
  while (true) {
    String input = readString("$prompt (DD/MM/YYYY): ");

    List<String> parts = input.split('/');
    if (parts.length == 3) {
      int? day = int.tryParse(parts[0]);
      int? month = int.tryParse(parts[1]);
      int? year = int.tryParse(parts[2]);

      if (day != null && month != null && year != null) {
        try {
          DateTime date = DateTime(year, month, day);
          return date;
        } catch (e) {
          print("Invalid date.");
        }
      }
    }
    print("Use DD/MM/YYYY.");
  }
}

String formatDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();
  return "$day/$month/$year";
}
