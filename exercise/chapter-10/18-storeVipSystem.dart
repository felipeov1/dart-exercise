import '../reads.dart';

class Client {
  String name;
  final int cpf;
  final int rg;
  String address;
  final DateTime firstBuyDate;
  double totalSpent;
  bool isVip;

  Client(
    this.name,
    this.cpf,
    this.rg,
    this.address,
    this.firstBuyDate,
    this.totalSpent,
    this.isVip,
  );
}

List<Client> clients = [];

int findClient(int rg) {
  for (int i = 0; i < clients.length; i++) {
    if (clients[i].rg == rg) {
      return i;
    }
  }
  return -1;
}

void addClient() {
  int rg = readInt("write client RG: ");
  
  if (findClient(rg) != -1) {
    print("Client with this RG already exists.");
    return;
  }
  
  String name = readString("write client name: ");
  int cpf = readInt("write client CPF: ");
  String address = readString("write client address: ");
  DateTime firstBuy = readDate("write first buy date");

  clients.add(Client(name, cpf, rg, address, firstBuy, 0.0, false));
  print("Client added.");
}

void updateClientTotal() {
  int rg = readInt("write client RG to update: ");
  int index = findClient(rg);

  if (index == -1) {
    print("Client not found.");
    return;
  }

  Client client = clients[index];
  double newPurchase = readDouble("write new purchase amount: ");
  
  client.totalSpent += newPurchase;
  print("Client total updated to: ${client.totalSpent}");

  if (!client.isVip && client.totalSpent > 5000.00) {
    client.isVip = true;
    print("Client ${client.name} is now a VIP!");
  }
}

void checkSpendingReset() {
  DateTime now = DateTime.now();
  int resetCount = 0;
  
  for (Client client in clients) {
    if (!client.isVip) {
      int days = now.difference(client.firstBuyDate).inDays;
      if (days > 180) {
        client.totalSpent = 0.0;
        resetCount++;
      }
    }
  }
  
  if (resetCount > 0) {
    print("$resetCount non-VIP client totals were reset.");
  } else {
    print("No client totals were reset.");
  }
}

void viewAllClients() {
  print("ALL CLIENTS");
  if (clients.isEmpty) {
    print("No clients registered.");
    return;
  }
  
  for (Client c in clients) {
    print("Name: ${c.name}, RG: ${c.rg}, Total: ${c.totalSpent}, VIP: ${c.isVip}");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Client");
    print("2. Update Client Total Spent");
    print("3. Check for Spending Resets");
    print("4. View All Clients");
    print("5. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addClient(); break;
      case 2: updateClientTotal(); break;
      case 3: checkSpendingReset(); break;
      case 4: viewAllClients(); break;
      case 5: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 5);
}


