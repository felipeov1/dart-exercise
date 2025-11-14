import '../reads.dart';

int findNumber(List<int?> vt, int number) {
  for (int i = 0; i < vt.length; i++) {
    if (vt[i] == null) {
      break; 
    }
    if (vt[i] == number) {
      return i;
    }
  }
  return -1;
}

void insertNumber(List<int?> vt) {
  if (vt[vt.length - 1] != null) {
    print("Vector is full.");
    return;
  }

  int number = readInt("Write a number to insert: ");
  if (findNumber(vt, number) != -1) {
    print("Number already exists in vector.");
    return;
  }

  int insertPos = 0;
  while (insertPos < vt.length) {
    if (vt[insertPos] == null || vt[insertPos]! > number) {
      break;
    }
    insertPos++;
  }

  for (int i = vt.length - 1; i > insertPos; i--) {
    vt[i] = vt[i - 1];
  }

  vt[insertPos] = number;
  print("Number added.");
}

void showVectorNumbers(List<int?> vt) {
  bool empty = true;
  for (int i = 0; i < vt.length; i++) {
    if (vt[i] != null) {
      print("vector position $i: ${vt[i]}");
      empty = false;
    }
  }
  if (empty) {
    print("Vector is empty.");
  }
}

void consultANumber(List<int?> vt) {
  int number = readInt("Write a number to consult: ");
  int foundIndex = findNumber(vt, number);

  if (foundIndex == -1) {
    print("Number $number not found in vector.");
  } else {
    print("Number $number was found at index $foundIndex.");
  }
}

void deleteVectorNumber(List<int?> vt) {
  int number = readInt("Write a number to delete: ");
  int foundIndex = findNumber(vt, number);

  if (foundIndex != -1) {
    for (int i = foundIndex; i < vt.length - 1; i++) {
      vt[i] = vt[i + 1];
    }
    vt[vt.length - 1] = null; 
    print("Number $number was removed.");
  } else {
    print("Number $number not found in vector.");
  }
}

void emptyVector(List<int?> vt) {
  for (int i = 0; i < vt.length; i++) {
    vt[i] = null;
  }
  print("Vector is empty.");
}

void main() {
  List<int?> vector = List.filled(10, null);

  int option = 0;
  do {
    print("1. Insert a number");
    print("2. Consult all numbers");
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