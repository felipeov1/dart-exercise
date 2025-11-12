import 'dart:math';

List<int> randomNumbers(qnty) {
  List<int> numbers = [];

  Random random = new Random();

  for (int i = 0; i < qnty; i++) {
    int randomNumber = random.nextInt(100);
    numbers.add(randomNumber);
  }

  return numbers;
}

void main() {
  List<int> randomNums = randomNumbers(7);
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
