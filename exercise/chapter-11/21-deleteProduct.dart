import './helpers/loadFile.dart';
import './helpers/saveFile.dart';
import '../reads.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products to delete.');
    return;
  }

  int codeToDelete = readInt('write product code to delete: ');
  int initialCount = allProducts.length;

  allProducts.removeWhere((product) => product['codigo'] == codeToDelete);

  if (allProducts.length == initialCount) {
    print('Product code not found.');
  } else {
    saveFile(productsFile, allProducts);
    print('Product deleted.');
  }
}

