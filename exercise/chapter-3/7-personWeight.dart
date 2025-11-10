import '../reads.dart';

void main() {
  double personWeight = readDouble("write the person's weight (kg): ");

  double weightLoss15 = personWeight * 0.15;
  double weightLoss20 = personWeight * 0.20;

  print("The person lost: $weightLoss15 kg");
  print("The person lost: $weightLoss20 kg");
}
