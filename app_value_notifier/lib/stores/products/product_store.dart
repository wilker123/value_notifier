import 'package:app_value_notifier/services/products/products_services.dart';
import 'package:app_value_notifier/states/product_states/product_state.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductsService service;

  ProductStore(this.service) : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final products = await service.fetchProductsService();
      value = SucessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
