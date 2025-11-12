import '../reads.dart';

class State {
  final String name;
  final int vehicleCount;
  final int accidentCount;
  double accidentIndex = 0.0;

  State(this.name, this.vehicleCount, this.accidentCount) {
    if (vehicleCount > 0) {
      accidentIndex = accidentCount / vehicleCount;
    }
  }
}

List<State> states = [];
const int maxStates = 15;

void readAllStates() {
  for (int i = 0; i < maxStates; i++) {
    print("--- State ${i + 1} ---");
    String name = readString("write state name: ");
    int vehicles = readInt("write vehicle count: ");
    int accidents = readInt("write accident count: ");
    
    states.add(State(name, vehicles, accidents));
  }
  print("All states added.");
}

void showMinMaxAccidentIndex() {
  if (states.isEmpty) {
    print("No states found.");
    return;
  }

  State minState = states[0];
  State maxState = states[0];

  for (int i = 1; i < states.length; i++) {
    if (states[i].accidentIndex < minState.accidentIndex) {
      minState = states[i];
    }
    if (states[i].accidentIndex > maxState.accidentIndex) {
      maxState = states[i];
    }
  }

  print("Highest Index: ${maxState.name} (${maxState.accidentIndex.toStringAsFixed(4)})");
  print("Lowest Index: ${minState.name} (${minState.accidentIndex.toStringAsFixed(4)})");
}

void showVehiclePercentage() {
  if (states.isEmpty) {
    print("No states found.");
    return;
  }

  int totalVehicles = 0;
  for (State s in states) {
    totalVehicles += s.vehicleCount;
  }

  if (totalVehicles == 0) {
    print("Total vehicles is zero, can't calculate percentage.");
    return;
  }

  print("Vehicle Percentage per State:");
  for (State s in states) {
    double percentage = (s.vehicleCount / totalVehicles) * 100;
    print("${s.name}: ${percentage.toStringAsFixed(2)}%");
  }
}

void showAverageAccidents() {
  if (states.isEmpty) {
    print("No states with accidents.");
    return;
  }

  int totalAccidents = 0;
  for (State s in states) {
    totalAccidents += s.accidentCount;
  }

  double average = totalAccidents / states.length;
  print("Average accidents per state: ${average.toStringAsFixed(2)}");
}

void main() {
  readAllStates();

  int option = 0;
  do {
    print("1. Show Min/Max Accident Index");
    print("2. Show Vehicle Percentages");
    print("3. Show Average Accidents");
    print("4. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        showMinMaxAccidentIndex();
        break;
      case 2:
        showVehiclePercentage();
        break;
      case 3:
        showAverageAccidents();
        break;
      case 4:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 4);
}