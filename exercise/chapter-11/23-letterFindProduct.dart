import './helpers/loadFile.dart';
import '../reads.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  String letter = readString('write the letter to search for: ');
  double minPrice = readDouble('write the minimum price: ');
  double maxPrice = readDouble('write the maximum price: ');

  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products registered.');
    return;
  }

  bool found = false;
  print(
      'Products starting with "$letter" and price between $minPrice and $maxPrice:');

  for (var product in allProducts) {
    String description = product['descricao'];
    double price = product['preco'];

    if (description.toLowerCase().startsWith(letter.toLowerCase()) &&
        price >= minPrice &&
        price <= maxPrice) {
      print(
          'Code: ${product['codigo']}, Desc: $description, Price: $price');
      found = true;
    }
  }

  if (!found) {
    print('No products found.');
  }
}