import './helpers/loadFile.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products registered.');
    return;
  }

  bool found = false;
  print('Products with price > 500.00:');

  for (var product in allProducts) {
    if (product['preco'] > 500.00) {
      print('Description: ${product['descricao']}');
      found = true;
    }
  }

  if (!found) {
    print('No products found with a price above 500.00.');
  }
}
