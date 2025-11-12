import '../reads.dart';

void main() {
  String date = readString("write a date (DD/MM/YYYY): ");
  List<String> parts = date.split('/');

  if (parts.length != 3) {
    print("Invalid format.");
    return;
  }

  int? monthNum = int.tryParse(parts[1]);
  if (monthNum == null || monthNum < 1 || monthNum > 12) {
    print("Invalid month.");
    return;
  }

  List<String> monthNames = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];
  
  String day = parts[0];
  String monthName = monthNames[monthNum - 1];
  String year = parts[2];

  print("$day of $monthName of $year");
}