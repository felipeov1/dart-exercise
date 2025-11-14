import './helpers/loadFile.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products registered.');
    return;
  }

  bool found = false;
  print('Products with price < 15.00:');

  for (var product in allProducts) {
    if (product['preco'] < 15.00) {
      print(
          'Code: ${product['codigo']}, Desc: ${product['descricao']}, Price: ${product['preco']}');
      found = true;
    }
  }

  if (!found) {
    print('No products found with a price below 15.00.');
  }
}

