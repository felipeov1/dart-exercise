import '../reads.dart';
import './helpers/loadFile.dart';
import './helpers/saveFile.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  int code = readInt('write product code: ');

  for (var product in allProducts) {
    if (product['codigo'] == code) {
      print('Product code already exists.');
      return;
    }
  }

  String description = readString('write description: ');
  double price = readDouble('write price: ');

  allProducts.add({
    'codigo': code,
    'descricao': description,
    'preco': price,
  });

  saveFile(productsFile, allProducts);
  print('Product added.');
}


