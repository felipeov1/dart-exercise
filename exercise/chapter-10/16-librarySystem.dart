import '../reads.dart';

class Work {
  final int tomboNumber;
  int exemplarNumber;
  final String buyDate;

  Work(this.tomboNumber, this.exemplarNumber, this.buyDate);
}

class Tombo {
  final int tomboNumber;
  final String workName;
  final String authorName;
  final String editorName;
  final int areaCode;

  Tombo(
    this.tomboNumber,
    this.workName,
    this.authorName,
    this.editorName,
    this.areaCode,
  );
}

List<Work> works = [];
List<Tombo> tombos = [];

const int maxTombos = 20;
const int maxWorksPerTombo = 3;

int findTombo(int code) {
  for (int i = 0; i < tombos.length; i++) {
    if (tombos[i].tomboNumber == code) {
      return i;
    }
  }
  return -1;
}

int countWorksForTombo(int tomboNumber) {
  int count = 0;
  for (Work w in works) {
    if (w.tomboNumber == tomboNumber) {
      count++;
    }
  }
  return count;
}

void registerTombo() {
  int code = readInt("write tombo number: ");
  if (findTombo(code) != -1) {
    print("Tombo code exists.");
    return;
  }

  String name = readString("write work name: ");
  String author = readString("write author name: ");
  String editor = readString("write editor name: ");
  int area = readInt("write area code 1-Exact, 2-Human, 3-Biomed: ");

  tombos.add(Tombo(code, name, author, editor, area));
  print("Tombo registered");
}

void registerWork() {
  int tomboCode = readInt("write tombo number to link: ");
  if (findTombo(tomboCode) == -1) {
    print("Tombo not found.");
    return;
  }

  if (countWorksForTombo(tomboCode) >= maxWorksPerTombo) {
    print("This tombo already has 3 copies.");
    return;
  }

  int exemplarNum = readInt("write exemplar number: ");
  String buyDate = readString("write buy date (DD/MM/YYYY): ");

  works.add(Work(tomboCode, exemplarNum, buyDate));
  print("Work registered.");
}

void showWorksByArea() {
  int area = readInt("write area code to search: ");
  bool found = false;
  print("Works in area $area:");

  for (Tombo t in tombos) {
    if (t.areaCode == area) {
      print("Name: ${t.workName}, Author: ${t.authorName}");
      found = true;
    }
  }
  if (!found) {
    print("No works found.");
  }
}

void showWorksByAuthor() {
  String author = readString("write author name: ");
  bool found = false;
  print("Works by $author:");

  for (Tombo t in tombos) {
    if (t.authorName.toLowerCase() == author.toLowerCase()) {
      print("Name: ${t.workName}, Editor: ${t.editorName}");
      found = true;
    }
  }
  if (!found) {
    print("No works found.");
  }
}

void showWorksByEditor() {
  String editor = readString("write editor name: ");
  bool found = false;
  print("Works by $editor:");

  for (Tombo t in tombos) {
    if (t.editorName.toLowerCase() == editor.toLowerCase()) {
      print("Name: ${t.workName}, Author: ${t.authorName}");
      found = true;
    }
  }
  if (!found) {
    print("No works found.");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Register Tombo");
    print("2. Register Work");
    print("3. Show Works by Area");
    print("4. Show Works by Author");
    print("5. Show Works by Editor");
    print("6. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        registerTombo();
        break;
      case 2:
        registerWork();
        break;
      case 3:
        showWorksByArea();
        break;
      case 4:
        showWorksByAuthor();
        break;
      case 5:
        showWorksByEditor();
        break;
      case 6:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 6);
}
