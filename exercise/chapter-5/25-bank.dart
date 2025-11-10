import '../reads.dart';

void main() {
  int clientCode;
  int investmentType;
  double investmentValue;
  double totalInvested = 0.0;
  double totalInterestPaid = 0.0;

  while (true) {
    clientCode = readInt("Write the client code (0 or less to exit): ");
    
    if (clientCode <= 0) {
      break;
    }

    investmentType = readInt("Write the investment type (1-Poupança, 2-Poupança Plus, 3-Fundos): ");
    investmentValue = readDouble("Write the invested value: ");

    double profitRate = 0.0;
    
    switch (investmentType) {
      case 1:
        profitRate = 0.015; 
        break;
      case 2:
        profitRate = 0.02; 
        break;
      case 3:
        profitRate = 0.04; 
        break;
      default:
        print("Invalid investment type.");
    }

    double monthlyProfit = investmentValue * profitRate;
    totalInvested += investmentValue;
    totalInterestPaid += monthlyProfit;

    print("Monthly profit: ${monthlyProfit.toStringAsFixed(2)}");
  }

  print("Total amount invested: ${totalInvested.toStringAsFixed(2)}");
  print("Total interest paid: ${totalInterestPaid.toStringAsFixed(2)}");
}