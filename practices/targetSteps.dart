import 'reads.dart';

void main() {
  double stepsHeight = readDouble("write the height of each step (cm): ");
  double targetHeight = readDouble("write the target height to reach (cm): ");

  double numberOfSteps = targetHeight / stepsHeight;

  print("Number of steps needed to reach the target height: $numberOfSteps");
}
