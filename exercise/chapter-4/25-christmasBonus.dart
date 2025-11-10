import '../reads.dart';

void main() {
  double overtimeHours = readDouble("Write the overtime hours: ");
  double absenceHours = readDouble("Write the absence hours: ");
  
  double bonus = 0.0;

  double hInHours = overtimeHours - (2.0 / 3.0 * absenceHours);
  double hInMinutes = hInHours * 60;

  if (hInMinutes >= 2400) {
    bonus = 500.0;
  } else if (hInMinutes >= 1800) {
    bonus = 400.0;
  } else if (hInMinutes >= 1200) {
    bonus = 300.0;
  } else if (hInMinutes >= 600) {
    bonus = 200.0;
  } else {
    bonus = 100.0;
  }

  print("The Christmas bonus is: R\$${bonus.toStringAsFixed(2)}");
}