import '../reads.dart';

void main() {
  int hours = readInt("Write the quantity of hours: ");
  int minutes = readInt("Write the quantity of minutes: ");

  int hoursToMinutes = hours * minutes;

  int minutesTotal = minutes + hoursToMinutes;

  int minutesToSeconds = minutesTotal * 60;

  print("Hour to minute: ${hoursToMinutes}");
  print("Total Minutes: ${minutesTotal}");
  print("Minutes to seconds: ${minutesToSeconds}");
}
