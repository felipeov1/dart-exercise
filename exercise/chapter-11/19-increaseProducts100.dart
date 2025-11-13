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
    
    if (currentPrice > 100.00) {
      product['preco'] = currentPrice + 10.00;
      count++;
    }
  }

  saveFile(productsFile, allProducts);
  print('$count products costing > 100.00 were updated.');
}

