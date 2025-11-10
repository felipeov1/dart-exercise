import '../reads.dart';

void calculateAges(int bornYear, int currentYear) {
  int ageInYears = currentYear - bornYear;
  double ageInMonths = ageInYears * 12;
  double ageInDays = ageInYears * 365;
  double ageInWeeks = ageInDays / 7;

  print(
    "You have $ageInYears years. In months, that's $ageInMonths months. In days, that's $ageInDays days. In weeks, that's $ageInWeeks weeks.",
  );
}

void main() {
  int bornYear = readInt("write your born year: ");
  int currentYear = readInt("write the current year: ");

  calculateAges(bornYear, currentYear);
}
