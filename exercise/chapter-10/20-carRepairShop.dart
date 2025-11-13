import '../reads.dart';

class ServiceOrder {
  final int orderNumber;
  final String date;
  final double value;
  final String serviceDescription;
  final String clientName;

  ServiceOrder(this.orderNumber, this.date, this.value, this.serviceDescription,
      this.clientName);
}

List<ServiceOrder> serviceOrders = [];

int findOrder(int orderNumber) {
  for (int i = 0; i < serviceOrders.length; i++) {
    if (serviceOrders[i].orderNumber == orderNumber) {
      return i;
    }
  }
  return -1;
}

void addServiceOrder() {
  int num = readInt("write order number: ");
  if (findOrder(num) != -1) {
    print("Order number exists.");
    return;
  }

  String date = readString("write date");
  double value = readDouble("write value: ");
  String service = readString("write service description: ");
  String client = readString("write client name: ");

  serviceOrders.add(ServiceOrder(num, date, value, service, client));
  print("Service order added.");
}

void showFinalReport() {
  if (serviceOrders.isEmpty) {
    print("No service orders.");
    return;
  }

  double totalValue = 0;
  ServiceOrder mostExpensiveOrder = serviceOrders[0];

  for (ServiceOrder order in serviceOrders) {
    totalValue += order.value;
    if (order.value > mostExpensiveOrder.value) {
      mostExpensiveOrder = order;
    }
  }

  double averageValue = totalValue / serviceOrders.length;

  print("Average Value: ${averageValue.toStringAsFixed(2)}");
  print("Most Expensive Service:");
  print("Client: ${mostExpensiveOrder.clientName}");
  print("Service: ${mostExpensiveOrder.serviceDescription}");
  print("Date: ${mostExpensiveOrder.date}");
}

void main() {
  int option = 0;
  do {
    print("1. Add Service Order");
    print("2. Show Final Report");
    print("3. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        addServiceOrder();
        break;
      case 2:
        showFinalReport();
        break;
      case 3:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 3);
}



