import '../reads.dart';
import 'dart:math';

void main() {
  double bridgeLengthKm = 0;

  while (true) {
    bridgeLengthKm = readDouble("write the bridge length in km (between 2 and 4): ");
    if (bridgeLengthKm >= 2 && bridgeLengthKm <= 4) {
      break;
    } else {
      print("write a value between 2 and 4.");
    }
  }

  double bridgeLength = bridgeLengthKm * 1000;
  double mastHeight = bridgeLength * (1.0 / 20.0);
  double halfBridgeLength = bridgeLength / 2.0;

  double baseSquared = pow(halfBridgeLength, 2).toDouble();
  double heightSquared = pow(mastHeight, 2).toDouble();
  double singleCableLength = sqrt(baseSquared + heightSquared);

  int cablesPerMast = 5;
  int totalMasts = 4;
  double totalCableLength = singleCableLength * cablesPerMast * totalMasts;

  print("Total meters of cable needed: ${totalCableLength.toStringAsFixed(2)}");
}