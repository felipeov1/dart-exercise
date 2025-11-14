import '../reads.dart';

void insertNumber(List<int> vt) {
  int number = readInt("Write a number to insert: ");
  vt.add(number);
  print("Number added.");
}

void showVectorNumbers(List<int> vt) {
  if (vt.isEmpty) {
    print("Vector is empty.");
    return;
  }
  for (int i = 0; i < vt.length; i++) {
    print("vector number $i: ${vt[i]}");
  }
}

void consultANumber(List<int> vt) {
  int number = readInt("Write a number to consult: ");
  int foundIndex = vt.indexOf(number);

  if (foundIndex == -1) {
    print("Number $number not found in vector.");
  } else {
    print("Number $number was found at index $foundIndex.");
  }
}

void deleteVectorNumber(List<int> vt) {
  int number = readInt("Write a number to delete: ");
  bool removed = vt.remove(number);

  if (removed) {
    print("Number $number was removed.");
  } else {
    print("Number $number not found in vector.");
  }
}

void emptyVector(List<int> vt) {
  vt.clear();
  print("Vector is  empty.");
}

void main() {
  List<int> vector = [];

  int option = 0;
  do {
    print("1. Insert a number");
    print("2. COnsult all numbers");
    print("3. Consult a number");
    print("4. Delete a number");
    print("5. Empty Vector");
    print("6. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        insertNumber(vector);
        break;
      case 2:
        showVectorNumbers(vector);
        break;
      case 3:
        consultANumber(vector);
        break;
      case 4:
        deleteVectorNumber(vector);
        break;
      case 5:
        emptyVector(vector);
        break;
      case 6:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 6);
}