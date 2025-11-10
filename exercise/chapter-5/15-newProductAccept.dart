import '../reads.dart';

void main() {
  int totalPeople = 10;
  int totalYes = 0;
  int totalNo = 0;
  int womanYes = 0;
  int totalMen = 0;
  int menNo = 0;

  for (int i = 1; i <= totalPeople; i++) {
    print("Person $i");
    String sex = readString("Write the sex (M or F): ");
    String opinion = readString("Write the opinion (S - Yes or N - No): ");

    if (sex.toUpperCase() == 'M') {
      totalMen++;
    }

    if (opinion.toUpperCase() == 'S') {
      totalYes++;
      if (sex.toUpperCase() == 'F') {
        womanYes++;
      }
    } else if (opinion.toUpperCase() == 'N') {
      totalNo++;
      if (sex.toUpperCase() == 'M') {
        menNo++;
      }
    }
  }

  double percentMenNo = 0.0;
  if (totalMen > 0) {
    percentMenNo = (menNo / totalMen) * 100;
  }

  print("Total 'Yes': $totalYes");
  print("Total 'No': $totalNo");
  print("Women who answered 'Yes': $womanYes");
  print("Percentage of men who answered 'No': ${percentMenNo.toStringAsFixed(2)}%");
}