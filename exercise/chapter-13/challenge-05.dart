import '../reads.dart';
import 'dart:math';

void main() {
  double l = readDouble("write the value for L: ");
  double minimumWage = readDouble("write the minimum wage: ");

  double lSquare = pow(l, 2).toDouble();

  double livingRoomArea = 8 * lSquare;
  double bedroom = 4 * lSquare;

  double wcRadius = l / 4.0;
  double wcsArea = 4 * (pi * pow(wcRadius, 2));

  double escArea = (l * l) / 2.0;
  
  double copaBase1 = l;
  double copaBase2 = l * 0.7;
  double copaHeight = l;
  double copaArea = ((copaBase1 + copaBase2) * copaHeight) / 2.0;

  double totalArea = livingRoomArea + bedroom + wcsArea + escArea + copaArea;

  double costPerSuareMeter = minimumWage * 0.10;
  double totatCost = totalArea * costPerSuareMeter;

  print("Total cost for one house: ${totatCost.toStringAsFixed(2)}");
}