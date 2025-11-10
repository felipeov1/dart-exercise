import '../reads.dart';

void main() {
  double averageAmount = readDouble(
    "write the average amount spent in the last year: ",
  );

  if (averageAmount > 400) {
    double credit = averageAmount * 0.30;
    print("The credit available is: \$${credit.toStringAsFixed(2)}");
  } else if (averageAmount >= 300) {
    double credit = averageAmount * 0.25;
    print("The credit available is:\$${credit.toStringAsFixed(2)}");
  } else if (averageAmount >= 200) {
    double credit = averageAmount * 0.20;
    print("The credit available is: \$${credit.toStringAsFixed(2)}");
  } else if (averageAmount < 200) {
    double credit = averageAmount * 0.10;
    print("The credit available is: \$${credit.toStringAsFixed(2)}");
  } else {
    print("No credit available for your amount");
  }
}
