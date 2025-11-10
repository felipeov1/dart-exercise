import '../reads.dart';

void main() {
  print("Temperature Conversion Menu:");
  print("1. Celsius to Fahrenheit");
  print("2. Celcius to Kelvin");
  print("3. Fahrenheit to Celsius");
  print("4. Fahrenheit to Kelvin");
  print("5. Kelvin to Celsius");
  print("6. Kelvin to Fahrenheit");
  String choice = readString("Choose an option (1-6): ");

  double temperature = readDouble("write the temperature to convert: ");
  double convertedTemperature;

  switch (choice) {
    case '1':
      convertedTemperature = (temperature * 9 / 5) + 32;
      print(
        "$temperature °C is equal to ${convertedTemperature.toStringAsFixed(2)} °F",
      );
      break;
    case '2':
      convertedTemperature = temperature + 273.15;
      print(
        "$temperature °C is equal to ${convertedTemperature.toStringAsFixed(2)} K",
      );
      break;
    case '3':
      convertedTemperature = (temperature - 32) * 5 / 9;
      print(
        "$temperature °F is equal to ${convertedTemperature.toStringAsFixed(2)} °C",
      );
      break;
    case '4':
      convertedTemperature = (temperature - 32) * 5 / 9 + 273.15;
      print(
        "$temperature °F is equal to ${convertedTemperature.toStringAsFixed(2)} K",
      );
      break;
    case '5':
      convertedTemperature = temperature - 273.15;
      print(
        "$temperature K is equal to ${convertedTemperature.toStringAsFixed(2)} °C",
      );
      break;
    case '6':
      convertedTemperature = (temperature - 273.15) * 9 / 5 + 32;
      print(
        "$temperature K is equal to ${convertedTemperature.toStringAsFixed(2)} °F",
      );
      break;
    default:
      print("Invalid option selected.");
  }
}
