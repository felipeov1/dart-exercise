import './helpers/loadFile.dart';
import './helpers/saveFile.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);


  int initialCount = allProducts.length;

  allProducts.removeWhere((product) => product['preco'] > 200.00);

  int finalCount = allProducts.length;
  int removedCount = initialCount - finalCount;

  if (removedCount == 0) {
    print('No products found with price > 200.00.');
  } else {
    saveFile(productsFile, allProducts);
    print('$removedCount products deleted.');
  }
}