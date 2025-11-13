import './helpers/loadFile.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products registered.');
    return;
  }

  bool found = false;
  print('Products with name starting with "M":');

  for (var product in allProducts) {
    String description = product['descricao'];
    if (description.toLowerCase().startsWith('m')) {
      print(
          'Code: ${product['codigo']}, Desc: ${product['descricao']}, Price: ${product['preco']}');
      found = true;
    }
  }

 
}



