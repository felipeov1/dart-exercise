import '../reads.dart';

void main() {
  double salary = readDouble("Write your monthly salary: ");

  if (salary < 500) {
    print("Your salary isn't on the range to increase.");
  } else {
    salary = salary + (salary * 0.30);
    print("Your salary with 30% increase is: $salary");
  }
}
