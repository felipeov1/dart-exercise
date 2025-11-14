import './helpers/loadFile.dart';
import './helpers/saveFile.dart';
import '../reads.dart';

const String productsFile = 'exercise/chapter-11/files/product/PRODUTOS.DAT';

void main() {
  double discountPercent = readDouble('write the discount percentage: ');
  double minPrice = readDouble('write the minimum price: ');
  double maxPrice = readDouble('write the maximum price: ');

  if (maxPrice < minPrice) {
    print('Max price must be greater than or equal to min price.');
    return;
  }
  
  List<dynamic> allProducts = loadFile(productsFile);

  if (allProducts.isEmpty) {
    print('No products to update.');
    return;
  }

  int count = 0;
  double discountDecimal = discountPercent / 100.0;

  for (var product in allProducts) {
    double currentPrice = product['preco'];
    
    if (currentPrice >= minPrice && currentPrice <= maxPrice) {
      double discountAmount = currentPrice * discountDecimal;
      product['preco'] = currentPrice - discountAmount;
      count++;
    }
  }

  saveFile(productsFile, allProducts);
  print('$count products updated with a $discountPercent% discount.');

}