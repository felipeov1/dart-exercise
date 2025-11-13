import '../reads.dart';

class Stylist {
  final int codStylist;
  String name;
  double salary;

  Stylist(this.codStylist, this.name, this.salary);
}

class Clothing {
  final int codClothing;
  String description;
  final int codStylist;
  final int codSeason;
  int year;

  Clothing(this.codClothing, this.description, this.codStylist, this.codSeason,
      this.year);
}

class Season {
  final int codSeason;
  String name;

  Season(this.codSeason, this.name);
}

List<Stylist> stylists = [];
List<Clothing> clothes = [];
List<Season> seasons = [];

int findStylist(int code) {
  for (int i = 0; i < stylists.length; i++) {
    if (stylists[i].codStylist == code) {
      return i;
    }
  }
  return -1;
}

int findSeason(int code) {
  for (int i = 0; i < seasons.length; i++) {
    if (seasons[i].codSeason == code) {
      return i;
    }
  }
  return -1;
}

String getStylistName(int code) {
  int index = findStylist(code);
  return (index == -1) ? "Unknown" : stylists[index].name;
}

int countClothesInSeason(int codSeason) {
  int count = 0;
  for (Clothing c in clothes) {
    if (c.codSeason == codSeason) {
      count++;
    }
  }
  return count;
}

void addStylists() {
  for (int i = 0; i < 3; i++) {
    int code = readInt("write stylist code ${i + 1}: ");
    if (findStylist(code) != -1) {
      print("Stylist code exists.");
      i--;
      continue;
    }
    String name = readString("write stylist name: ");
    double salary = readDouble("write stylist salary: ");
    stylists.add(Stylist(code, name, salary));
  }
  print("3 stylists added.");
}

void addSeasons() {
  seasons.add(Season(1, "Primavera-Verão"));
  seasons.add(Season(2, "Outono-Inverno"));
  print("Seasons added.");
}

void addClothing() {
  int codStylist = readInt("write stylist code: ");
  if (findStylist(codStylist) == -1) {
    print("Stylist not found.");
    return;
  }

  int codSeason = readInt("write season code: ");
  if (findSeason(codSeason) == -1) {
    print("Season not found.");
    return;
  }

  if (countClothesInSeason(codSeason) >= 10) {
    print("This season is full (max 10 clothes).");
    return;
  }

  int codClothing = readInt("write clothing code: ");
  String description = readString("write clothing description: ");
  int year = readInt("write clothing year: ");

  clothes.add(Clothing(codClothing, description, codStylist, codSeason, year));
  print("Clothing added.");
}

void showReportBySeason() {
  int codSeason = readInt("write season code to report: ");
  int index = findSeason(codSeason);
  
  if (index == -1) {
    print("Season not found.");
    return;
  }

  bool found = false;
  
  for (Clothing c in clothes) {
    if (c.codSeason == codSeason) {
      String stylistName = getStylistName(c.codStylist);
      print("Desc: ${c.description}, Year: ${c.year}, Stylist: $stylistName");
      found = true;
    }
  }

  if (!found) {
    print("No clothes found for this season.");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Stylists (3 total)");
    print("2. Add Seasons (2 total)");
    print("3. Add Clothing");
    print("4. Show Report by Season");
    print("5. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addStylists(); break;
      case 2: addSeasons(); break;
      case 3: addClothing(); break;
      case 4: showReportBySeason(); break;
      case 5: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 5);
}