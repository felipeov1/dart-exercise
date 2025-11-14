import '../reads.dart';

class BirthdayPerson {
  String name;
  int day;
  int month;

  BirthdayPerson(this.name, this.day, this.month);
}

List<BirthdayPerson> agenda = [];
const int maxAgenda = 15;

int findPerson(String name) {
  for (int i = 0; i < agenda.length; i++) {
    if (agenda[i].name.toLowerCase() == name.toLowerCase()) {
      return i;
    }
  }
  return -1;
}

void addPerson() {
  if (agenda.length >= maxAgenda) {
    print("Agenda is full (max 15).");
    return;
  }

  String name = readString("write name: ");
  if (findPerson(name) != -1) {
    print("Name already exists.");
    return;
  }

  int day = readInt("write day (1-31): ");
  while (day < 1 || day > 31) {
    print("Invalid day.");
    day = readInt("write day (1-31): ");
  }

  int month = readInt("write month (1-12): ");
  while (month < 1 || month > 12) {
    print("Invalid month.");
    month = readInt("write month (1-12): ");
  }

  agenda.add(BirthdayPerson(name, day, month));
  print("Person added.");
}

void deletePerson() {
  String name = readString("write name to delete: ");
  int index = findPerson(name);

  if (index == -1) {
    print("Person not found.");
  } else {
    agenda.removeAt(index);
    print("Person removed.");
  }
}

void updatePerson() {
  String name = readString("write name to update: ");
  int index = findPerson(name);

  if (index == -1) {
    print("Person not found.");
    return;
  }

  int newDay = readInt("write new day (1-31): ");
  while (newDay < 1 || newDay > 31) {
    print("Invalid day.");
    newDay = readInt("write new day (1-31): ");
  }

  int newMonth = readInt("write new month (1-12): ");
  while (newMonth < 1 || newMonth > 12) {
    print("Invalid month.");
    newMonth = readInt("write new month (1-12): ");
  }

  agenda[index].day = newDay;
  agenda[index].month = newMonth;
  print("Birthday updated.");
}

void consultByDate() {
  int day = readInt("write day: ");
  int month = readInt("write month: ");
  bool found = false;

  print("Birthdays on $day/$month:");
  for (BirthdayPerson p in agenda) {
    if (p.day == day && p.month == month) {
      print(p.name);
      found = true;
    }
  }
  if (!found) {
    print("No birthdays found.");
  }
}

void consultByMonth() {
  int month = readInt("write month (1-12): ");
  bool found = false;

  print("Birthdays in month $month:");
  for (BirthdayPerson p in agenda) {
    if (p.month == month) {
      print("${p.name} - Day: ${p.day}");
      found = true;
    }
  }
  if (!found) {
    print("No birthdays found.");
  }
}

void consultByFirstLetter() {
  String letter = readString("write first letter: ");

  String firstLetter = letter[0].toLowerCase();
  bool found = false;

  print("Birthdays starting with '$firstLetter':");
  for (BirthdayPerson p in agenda) {
    if (p.name.toLowerCase().startsWith(firstLetter)) {
      print("${p.name} - ${p.day}/${p.month}");
      found = true;
    }
  }
  if (!found) {
    print("No birthdays found.");
  }
}

void showSortedByName() {
  if (agenda.isEmpty) {
    print("Agenda is empty.");
    return;
  }

  List<BirthdayPerson> sortedList = List.from(agenda);
  sortedList.sort(
    (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
  );

  print("Agenda (Sorted by Name):");
  for (BirthdayPerson p in sortedList) {
    print("${p.name} - ${p.day}/${p.month}");
  }
}

void showSortedByMonth() {
  if (agenda.isEmpty) {
    print("Agenda is empty.");
    return;
  }

  List<BirthdayPerson> sortedList = List.from(agenda);
  sortedList.sort((a, b) {
    int monthCompare = a.month.compareTo(b.month);
    if (monthCompare == 0) {
      return a.day.compareTo(b.day);
    }
    return monthCompare;
  });

  print("Agenda (Sorted by Month):");
  for (BirthdayPerson p in sortedList) {
    print("${p.month}/${p.day} - ${p.name}");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Person");
    print("2. Delete Person");
    print("3. Update Birthday");
    print("4. Consult by Date");
    print("5. Consult by Month");
    print("6. Consult by First Letter");
    print("7. Show All (Sort by Name)");
    print("8. Show All (Sort by Month)");
    print("9. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        addPerson();
        break;
      case 2:
        deletePerson();
        break;
      case 3:
        updatePerson();
        break;
      case 4:
        consultByDate();
        break;
      case 5:
        consultByMonth();
        break;
      case 6:
        consultByFirstLetter();
        break;
      case 7:
        showSortedByName();
        break;
      case 8:
        showSortedByMonth();
        break;
      case 9:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 9);
}