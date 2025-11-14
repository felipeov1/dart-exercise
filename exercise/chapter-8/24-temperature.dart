import '../../practices/reads.dart';
import '../chapter-7/5-matrix12x4.dart';

void showHighestTemperature(List<double> avgTemp) {
  double highestTemp = avgTemp[0];
  int highestMonthIndex = 0;

  for (int i = 1; i < avgTemp.length; i++) {
    if (avgTemp[i] > highestTemp) {
      highestTemp = avgTemp[i];
      highestMonthIndex = i;
    }
  }

  String monthName = monthConverter(highestMonthIndex + 1);
  print("Highest Temperature: $highestTemp in $monthName");
}

void showLowestTemperature(List<double> avgTemp) {
  double lowestTemp = avgTemp[0];
  int lowestMonthIndex = 0;

  for (int i = 1; i < avgTemp.length; i++) {
    if (avgTemp[i] < lowestTemp) {
      lowestTemp = avgTemp[i];
      lowestMonthIndex = i;
    }
  }

  String monthName = monthConverter(lowestMonthIndex + 1);
  print("Lowest Temperature: $lowestTemp in $monthName");
}

void main() {
  List<double> avgs = [];
  for (int i = 1; i <= 12; i++) {
    String month = monthConverter(i);
    double avgTemperature = readDouble("Write the temperature of $month: ");
    avgs.add(avgTemperature);
  }

  showHighestTemperature(avgs);
  showLowestTemperature(avgs);
}
