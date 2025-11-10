import '../reads.dart';

void main() {
  double hoursWorked = readDouble("write the number of hours worked: ");
  double extrasHoursWorked = readDouble(
    "write the number of extra hours worked: ",
  );
  double monthlySalary = readDouble("write the monthly salary: ");

  double hourValue = monthlySalary / 8;

  double hourExtraValue = monthlySalary / 4;

  double grossSalary = hoursWorked * hourValue;

  double extraHoursPending = extrasHoursWorked * hourExtraValue;

  double finalSalary = grossSalary + extraHoursPending;

  print("You will receive: ${finalSalary}");
}
