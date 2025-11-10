List<int> organizeGroups() {
  List<int> group1 = [34, 67, 23, 89];
  List<int> group2 = [76, 45, 90, 12];
  List<int> group3 = [98, 54, 31, 27];
  List<int> group4 = [123, 87, 65, 43];
  List<int> group5 = [201, 150, 99, 75];

  List<List<int>> group = [group1, group2, group3, group4, group5];

  List<int> groupMix = [];

  print("---- Groups Together ----");

  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 4; j++) {
      print("Group ${i + 1} - number ${group[i][j]}");
    }
    groupMix.addAll(group[i]);
  }

  return groupMix;
}

void bubbleSortCrescent(groupMix) {
  for (int i = 0; i < groupMix.length - 1; i++) {
    for (int j = 0; j < groupMix.length - 1; j++) {
      if (groupMix[j] > groupMix[j + 1]) {
        int temp;

        temp = groupMix[j];
        groupMix[j] = groupMix[j + 1];
        groupMix[j + 1] = temp;
      }
    }
  }
  print(groupMix);
}

void bubbleSortDecrescent(groupMix) {
  for (int k = 0; k < groupMix.length - 1; k++) {
    for (int l = 0; l < groupMix.length - 1; l++) {
      if (groupMix[l] < groupMix[l + 1]) {
        int temp;

        temp = groupMix[l + 1];
        groupMix[l + 1] = groupMix[l];
        groupMix[l] = temp;
      }
    }
  }
  print(groupMix);
}

void main() {
  List<int> groupMix = organizeGroups();

  // ponto de estudo: dessa forma bubbleSortDecrescent(groupMix); sem criar uma cópia eu perderia
  // os dados originais, entao joga os dados og para um var para manter eles
  List<int> crescentList = List.from(groupMix);
  print("\n--- Crescent ---");
  bubbleSortCrescent(crescentList);

  List<int> decrescentList = List.from(groupMix);
  print("\n--- Decrescent ---");
  bubbleSortDecrescent(decrescentList);
}
