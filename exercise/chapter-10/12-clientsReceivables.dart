import '../reads.dart';

class Client {
  final int Cod_cli;
  String Nome;
  String Endereco;
  String Fone;

  Client(this.Cod_cli, this.Nome, this.Endereco, this.Fone);
}

class Receipt {
  final int Num_doc;
  double Valor_doc;
  final DateTime Data_emissao;
  final DateTime Data_vencimento;
  final int Cod_cli;

  Receipt(this.Num_doc, this.Valor_doc, this.Data_emissao,
      this.Data_vencimento, this.Cod_cli);
}

List<Client> clients = [];
List<Receipt> receipts = [];

int findClient(int code) {
  for (int i = 0; i < clients.length; i++) {
    if (clients[i].Cod_cli == code) {
      return i;
    }
  }
  return -1;
}

String getClientName(int code) {
  int index = findClient(code);
  return (index == -1) ? "Unknown Client" : clients[index].Nome;
}

String formatDate(DateTime date) {
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();
  return "$day/$month/$year";
}

int countClientReceipts(int codCli) {
  int count = 0;
  for (Receipt r in receipts) {
    if (r.Cod_cli == codCli) {
      count++;
    }
  }
  return count;
}

void addClient() {
  int code = readInt("write client code: ");
  if (findClient(code) != -1) {
    print("Client code exists.");
    return;
  }
  String name = readString("write client name: ");
  String address = readString("write client address: ");
  String phone = readString("write client phone: ");

  clients.add(Client(code, name, address, phone));
  print("Client added.");
}

void addReceipt() {
  int codCli = readInt("write client code to link: ");
  if (findClient(codCli) == -1) {
    print("Client not found.");
    return;
  }

  int receiptCount = countClientReceipts(codCli);
  if (receiptCount >= 3) {
    print("Client already has 3 receipts. Cannot add more.");
    return;
  }

  int numDoc = readInt("write document number: ");
  double value = readDouble("write document value: ");
  DateTime issueDate = readDate("write issue date");
  DateTime dueDate = readDate("write due date");

  receipts.add(Receipt(numDoc, value, issueDate, dueDate, codCli));
  print("Receipt added.");
}

void updateClient() {
  int code = readInt("write client code to update: ");
  int index = findClient(code);

  if (index == -1) {
    print("Client not found.");
    return;
  }

  print("Updating client: ${clients[index].Nome}");
  clients[index].Nome = readString("write new name: ");
  clients[index].Endereco = readString("write new address: ");
  clients[index].Fone = readString("write new phone: ");
  print("Client updated.");
}

void showReceiptsByDate() {
  print("write the date range:");
  DateTime startDate = readDate("write start date");
  DateTime endDate = readDate("write end date");
  bool found = false;

  print("RECEIPTS IN PERIOD");

  for (Receipt r in receipts) {
    if ((r.Data_vencimento.isAfter(startDate) || r.Data_vencimento.isAtSameMomentAs(startDate)) &&
        (r.Data_vencimento.isBefore(endDate) || r.Data_vencimento.isAtSameMomentAs(endDate))) {
      
      String clientName = getClientName(r.Cod_cli);
      int daysLate = 0;
      DateTime today = DateTime.now();

      if (today.isAfter(r.Data_vencimento)) {
        daysLate = today.difference(r.Data_vencimento).inDays;
      }
      
      print("Doc: ${r.Num_doc}, Client: $clientName, Value: ${r.Valor_doc}");
      print("  Due: ${formatDate(r.Data_vencimento)}, Days Late: $daysLate");
      found = true;
    }
  }

  if (!found) {
    print("No receipts found in this period.");
  }
}

void viewAllData() {
  print("CLIENTS");
  if (clients.isEmpty) {
    print("No clients.");
  } else {
    clients.forEach((c) => print("Code: ${c.Cod_cli}, Name: ${c.Nome}"));
  }
  
  print("RECEIPTS");
  if (receipts.isEmpty) {
    print("No receipts.");
  } else {
    receipts.forEach((r) => print("Doc: ${r.Num_doc}, Client Code: ${r.Cod_cli}"));
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Client");
    print("2. Add Receipt");
    print("3. Update Client");
    print("4. Show Receipts by Date");
    print("5. View All Data");
    print("6. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1: addClient(); break;
      case 2: addReceipt(); break;
      case 3: updateClient(); break;
      case 4: showReceiptsByDate(); break;
      case 5: viewAllData(); break;
      case 6: print("Exited"); break;
      default: print("Invalid option.");
    }
  } while (option != 6);
}