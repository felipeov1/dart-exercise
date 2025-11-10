import '../reads.dart';

void main() {
  double salary = readDouble("write the salary: ");
  double salarywithAdjust = 0.0;

  if (salary <= 300) {
    salarywithAdjust = salary + (salary * 0.35);
    print(salarywithAdjust);
    return;
  }

  salarywithAdjust = salary + (salary * 0.15);
  print(salarywithAdjust);
}
