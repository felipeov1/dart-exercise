import '../reads.dart';

void main() {
  List<int> ages = [];

  int first = 0;
  int second = 0;
  int third = 0;
  int fourth = 0;
  int fifth = 0;

  for (int i = 0; i < 8; i++) {
    int age = readInt("write the age of the person ${i + 1}: ");
    ages.add(age);
  }

  for (int j = 0; j < ages.length; j++) {
    if (ages[j] <= 15) {
      first = first + 1;
    } else if (ages[j] <= 30) {
      second = second + 1;
    } else if (ages[j] <= 45) {
      third = third + 1;
    } else if (ages[j] <= 60) {
      fourth = fourth + 1;
    } else {
      fifth = fifth + 1;
    }
  }

  int totalPeople = first + second + third + fourth + fifth;

  double percentageFirstRelationTotal = (first / totalPeople) * 100;
  double percentageLastRelationTotal = (fifth / totalPeople) * 100;

  print("First Age Range: $first");
  print("Second Age Range: $second");
  print("Third Age Range: $third");
  print("Fourth Age Range: $fourth");
  print("Fifth Age Range: $fifth");

  print(
    "The percentage of the first relationed with total is: %$percentageFirstRelationTotal",
  );

  print(
    "The percentage of the last relationed with total is: %$percentageLastRelationTotal",
  );
}
