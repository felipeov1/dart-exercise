import '../reads.dart';

(double, double, double, double) calculateSurveyStats() {
  double totalSalary = 0;
  int totalSons = 0;
  int personCount = 0;
  double highestSalary = double.negativeInfinity;
  int countBelow380 = 0;

  while (true) {
    double salary = readDouble(
      "write the salary for person ${personCount + 1} (type -1 to finish): ",
    );

    if (salary == -1) {
      break; 
    }

    int sonQty = readInt("write the number of sons: ");

    totalSalary += salary;
    totalSons += sonQty;
    personCount++;

    if (salary > highestSalary) {
      highestSalary = salary;
    }

    if (salary < 380) {
      countBelow380++;
    }
  }

  if (personCount == 0) {
    return (0, 0, 0, 0);
  }

  double avgSalary = totalSalary / personCount;
  double avgSons = totalSons / personCount;
  double percentage = (countBelow380 / personCount) * 100;

  return (avgSalary, avgSons, highestSalary, percentage);
}

void main() {
  var (avgSalary, avgSons, highest, percentage) = calculateSurveyStats();

  print("Average Salary: ${avgSalary.toStringAsFixed(2)}");
  print("Average Sons: ${avgSons.toStringAsFixed(2)}");
  print("Highest Salary: ${highest.toStringAsFixed(2)}");
  print("Percentage with salary < 380: ${percentage.toStringAsFixed(2)}%");
}