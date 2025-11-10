import 'reads.dart';

void main() {
  double animalQuantity = readDouble("write the quantity of animals: ");
  double feedPerAnimalGrams = readDouble(
    "write the feed quantity per animal (g): ",
  );
  double feedWeightKg = readDouble(
    "write the weight of the feed package (kg): ",
  );

  double totalDailyGrams = animalQuantity * feedPerAnimalGrams;

  double totalDailyKg = totalDailyGrams / 1000;

  double totalConsumedFiveDays = totalDailyKg * 5;

  double remainingFeedKg = feedWeightKg - totalConsumedFiveDays;

  print("Total daily consumption: $totalDailyKg kg");
  print("Total consumed in 5 days: $totalConsumedFiveDays kg");
  print("Remaining feed after 5 days: $remainingFeedKg kg");
}
