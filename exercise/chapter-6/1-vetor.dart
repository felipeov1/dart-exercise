import 'dart:math';

List<int> randomNumbers() {
  List<int> numbers = [];

  Random random = new Random();

  for (int i = 0; i < 6; i++) {
    int randomNumber = random.nextInt(100);
    numbers.add(randomNumber);
  }

  return numbers;
}

void main() {
  List<int> randomNums = randomNumbers();

  List<int> odd = [];
  int oddCount = 0;
  List<int> even = [];

  for (int j = 0; j < randomNums.length; j++) {
    if (randomNums[j] % 2 == 0) {
      even.add(randomNums[j]);
    } else {
      odd.add(randomNums[j]);
    }
  }

  print("The numbers are: $randomNums");
  print("Numbers of even: ${even.length}. They are: $even");
  print("Numbers of odd: ${odd.length}. They are: $odd");
}
