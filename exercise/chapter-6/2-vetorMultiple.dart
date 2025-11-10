import 'dart:math';

List<int> randomNumbers() {
  List<int> numbers = [];

  Random random = new Random();

  for (int i = 0; i < 7; i++) {
    int randomNumber = random.nextInt(100);
    numbers.add(randomNumber);
  }

  return numbers;
}

void main() {
  List<int> randomNums = randomNumbers();
  List<int> multipleTowThree = [];
  List<int> multipleTow = [];
  List<int> multipleThree = [];

  for (int i = 0; i < randomNums.length; i++) {
    if (randomNums[i] % 2 == 0 && randomNums[i] % 3 == 0) {
      multipleTowThree.add(randomNums[i]);
    } else if (randomNums[i] % 2 == 0) {
      multipleTow.add(randomNums[i]);
    } else {
      multipleThree.add(randomNums[i]);
    }
  }

  print(multipleTowThree);
  print(multipleTow);
  print(multipleThree);
}
