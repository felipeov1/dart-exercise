import '../reads.dart';

class Product {
  int productNumber;
  double price;

  Product({required this.productNumber, required this.price});

  double calculateDiscountValue() {
    if (price > 100.0) {
      return price * 0.15;
    } else {
      return price * 0.05;
    }
  }
}

class Client {
  int clientNumber;
  String name;
  String sex;

  Client({required this.clientNumber, required this.name, required this.sex});

  double calculateAdditionalDiscount(double productPrice) {
    if (sex.toUpperCase() == 'F') {
      return productPrice * 0.05;
    } else {
      return 0.0;
    }
  }
}

class Purchase {
  Product product;
  Client client;
  int quantity;
  double totalValue = 0.0;

  Purchase({
    required this.product,
    required this.client,
    required this.quantity,
  });

  void calculateTotalValue() {
    double productPrice = product.price;
    double additionalDiscount = client.calculateAdditionalDiscount(productPrice);
    double finalPrice = productPrice - additionalDiscount;
    this.totalValue = quantity * finalPrice;
  }
}

List<Product> allProducts = [];
List<Client> allClients = [];

Product? findProductById(int id) {
  for (var p in allProducts) {
    if (p.productNumber == id) {
      return p;
    }
  }
  return null;
}

Client? findClientById(int id) {
  for (var c in allClients) {
    if (c.clientNumber == id) {
      return c;
    }
  }
  return null;
}

void main() {
  print("--- Registering 3 Products ---");
  for (int i = 0; i < 3; i++) {
    print("Write data for product ${i + 1}/3:");
    int number = readInt("Write product number: ");

    double price = 0.0;
    while (price < 20.0 || price > 350.0) {
      price = readDouble("Write price (between 20.00 and 350.00): ");
      if (price < 20.0 || price > 350.0) {
        print("Invalid price. Must be between 20.00 and 350.00.");
      }
    }

    Product p = Product(productNumber: number, price: price);
    allProducts.add(p);
    print("Product registered.");
  }

  print("\n--- Registering 3 Clients ---");
  for (int i = 0; i < 3; i++) {
    print("Write data for client ${i + 1}/3:");
    int number = readInt("Write client number: ");
    String name = readString("Write client name: ");

    String sex = "";
    while (sex.toUpperCase() != 'M' && sex.toUpperCase() != 'F') {
      sex = readString("Write sex (M/F): ");
      if (sex.toUpperCase() != 'M' && sex.toUpperCase() != 'F') {
        print("Invalid sex. Must be 'M' or 'F'.");
      }
    }

    Client c = Client(clientNumber: number, name: name, sex: sex.toUpperCase());
    allClients.add(c);
    print("Client registered.");
  }

  print("\n--- Register Purchase ---");
  int productNumberToBuy = readInt("Write product number for purchase: ");
  int clientNumberToBuy = readInt("Write client number for purchase: ");
  int quantityToBuy = readInt("Write quantity: ");

  Product? product = findProductById(productNumberToBuy);
  Client? client = findClientById(clientNumberToBuy);

  if (product == null) {
    print("Product not found.");
    return;
  }
  if (client == null) {
    print("Client not found.");
    return;
  }

  Purchase purchase = Purchase(
    product: product,
    client: client,
    quantity: quantityToBuy,
  );

  purchase.calculateTotalValue();

  print("Client: ${client.name}");
  print("Product: ${product.productNumber}");
  print("Unit Price: ${product.price.toStringAsFixed(2)}");
  print("Quantity: ${purchase.quantity}");
  print("Total Value: ${purchase.totalValue.toStringAsFixed(2)}");
}