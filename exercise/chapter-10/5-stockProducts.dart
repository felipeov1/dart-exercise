import '../reads.dart';

class Product {
  final int code;
  String description;
  double price;
  int stock;

  Product(this.code, this.description, this.price, this.stock);
}

List<Product> products = [];

const int maxProducts = 2;

int findProductIndex(int code) {
  for (int i = 0; i < products.length; i++) {
    if (products[i].code == code) {
      return i;
    }
  }
  return -1;
}

void readInitialProducts() {
  for (int i = 0; i < maxProducts; i++) {
    int code = readInt("write code for product ${i + 1}: ");
    String description = readString("write description: ");
    double price = readDouble("write price: ");
    int stock = readInt("write stock quantity: ");
    
    products.add(Product(code, description, price, stock));
  }
  
  products.sort((a, b) => a.code.compareTo(b.code));
}

void updateProduct() {
  int code = readInt("write the product code to update: ");
  int index = findProductIndex(code);

  if (index == -1) {
    print("Product not found.");
    return;
  }

  Product product = products[index];
  print("Updating product: ${product.description}");

  product.description = readString("write new description: ");
  product.price = readDouble("write new price: ");
  product.stock = readInt("write new stock quantity: ");
  
  print("Product updated");
}

void findProductsByLetter() {
  String letter = readString("write the first letter to search: ");
  
  if (letter.isEmpty) {
    print("No letter found.");
    return;
  }
  
  String searchLetter = letter[0].toLowerCase();
  List<Product> found = [];
  
  for (Product product in products) {
    if (product.description.toLowerCase().startsWith(searchLetter)) {
      found.add(product);
    }
  }

  if (found.isEmpty) {
    print("No products found starting with '$searchLetter'.");
    return;
  }

  for (Product p in found) {
    print("Code: ${p.code}, Desc: ${p.description}, Stock: ${p.stock}");
  }
}

void showLowStockProducts() {
  List<Product> lowStock = [];
  
  for (Product product in products) {
    if (product.stock < 5) {
      lowStock.add(product);
    }
  }

  if (lowStock.isEmpty) {
    print("No products with stock < 5.");
    return;
  }

  print("Products with low stock < 5");
  for (Product p in lowStock) {
    print("Code: ${p.code}, Desc: ${p.description}, Stock: ${p.stock}");
  }
}

void main() {
  readInitialProducts();

  int option = 0;
  do {
    print("1. Update Product");
    print("2. Find Products by Letter");
    print("3. Show Low Stock Products (< 5)");
    print("4. Exit");
    
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        updateProduct();
        break;
      case 2:
        findProductsByLetter();
        break;
      case 3:
        showLowStockProducts();
        break;
      case 4:
        print("Program finished.");
        break;
      default:
        print("Invalid option. Select 1,2,3 or 4");
    }
  } while (option != 4);
}