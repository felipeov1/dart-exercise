import '../reads.dart';

(List<int>, List<String>, List<double>, List<int>) readAllData() {
  List<int> ages = [];
  List<String> sexes = [];
  List<double> salaries = [];
  List<int> childrenCounts = [];
  
  for (int i = 1; i <= 15; i++) {
    print("write data for Person ${i}");
    int age = readInt("write age: ");
    String sex = readString("write sex (M/F): ");
    double salary = readDouble("write salary: ");
    int children = readInt("write number of children: ");
    
    ages.add(age);
    sexes.add(sex);
    salaries.add(salary);
    childrenCounts.add(children);
  }
  return (ages, sexes, salaries, childrenCounts);
}

double calculateAverageSalary(List<double> salaries) {
  if (salaries.isEmpty) {
    return 0.0;
  }
  double totalSum = 0;
  for (double salary in salaries) {
    totalSum += salary;
  }
  return totalSum / salaries.length;
}

(int, int) findMinMaxAge(List<int> ages) {
  if (ages.isEmpty) {
    return (0, 0);
  }
  
  int minAge = ages[0];
  int maxAge = ages[0];
  
  for (int age in ages) {
    if (age < minAge) {
      minAge = age;
    }
    if (age > maxAge) {
      maxAge = age;
    }
  }
  return (minAge, maxAge);
}

int countSpecificWomen(List<String> sexes, List<int> childrenCounts, List<double> salaries) {
  int count = 0;
  for (int i = 0; i < sexes.length; i++) {
    String sex = sexes[i];
    int children = childrenCounts[i];
    double salary = salaries[i];
    
    if (sex.toUpperCase() == "F" && children == 3 && salary <= 500.00) {
      count++;
    }
  }
  return count;
}

void main() {
  var (ages, sexes, salaries, childrenCounts) = readAllData();

  double avgSalary = calculateAverageSalary(salaries);
  var (minAge, maxAge) = findMinMaxAge(ages);
  int womenCount = countSpecificWomen(sexes, childrenCounts, salaries);

  print("Average Salary: ${avgSalary.toStringAsFixed(2)}");
  print("Smallest Age: $minAge");
  print("Largest Age: $maxAge");
  print("Women (3 children, <= R\$500): $womenCount");
}
