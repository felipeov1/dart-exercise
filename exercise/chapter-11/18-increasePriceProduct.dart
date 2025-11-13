import './helpers/loadFile.dart';
import './helpers/saveFile.dart';

const String productsFile = 'exercise/chapter-11/files/products/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products to update.');
    return;
  }

  int count = 0;
  for (var product in allProducts) {
    double currentPrice = product['preco'];
    double newPrice = currentPrice * 1.15;
    product['preco'] = newPrice;
    count++;
  }

  saveFile(productsFile, allProducts);
  print('$count products with a 15% increase.');
}

