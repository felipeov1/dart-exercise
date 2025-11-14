import '../reads.dart';

double calculateIdealWeight(sex, height) {
  double idealWeight = 0;

  if (sex == 'male') {
    idealWeight = 72.7 * height - 58.0;
  } else {
    idealWeight = 62.1 * height - 44.7;
  }

  return idealWeight;
}

void main() {
  String sex = readString("Your sex is: male or female: ");
  double height = readDouble("What's your height (m)? ");

  print(calculateIdealWeight(sex, height).toStringAsFixed(2));
}


