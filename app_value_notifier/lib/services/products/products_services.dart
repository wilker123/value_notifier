import 'package:app_value_notifier/models/products/product_model.dart';
import 'package:uno/uno.dart';

class ProductsService {
  final Uno uno;

  ProductsService(this.uno);

  Future<List<ProductModel>> fetchProductsService() async {
    final response = await uno.get("http://10.0.2.2:3031/products");
    final list = response.data as List;

    final products = list.map((e) => ProductModel.fromMap(e)).toList();
    return products;
  }
}
