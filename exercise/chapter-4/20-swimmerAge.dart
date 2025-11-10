import '../reads.dart';

void main() {
  int age = readInt("Write the swimmer age: ");
  String category = "";

  if (age < 5) {
    print("The swimmer is too young for a category.");
  } else if (age <= 7) {
    category = "Infantil";
  } else if (age <= 10) {
    category = "Juvenil";
  } else if (age <= 15) {
    category = "Adolescente";
  } else if (age <= 30) {
    category = "Adulto";
  } else {
    category = "Sênior";
  }

  print("The category is: $category");
}
