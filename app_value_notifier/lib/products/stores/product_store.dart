import 'package:app_value_notifier/products/models/product_model.dart';
import 'package:app_value_notifier/products/services/products_services.dart';
import 'package:app_value_notifier/products/states/product_state.dart';
import 'package:flutter/material.dart';

class ProductStore extends ValueNotifier<ProductState> {
  final ProductsService service;

  ProductStore(this.service) : super(InitialProductState());

  Future fetchProducts() async {
    value = LoadingProductState();
    try {
      final products = await service.fetchProducts();
      value = SucessProductState(products);
    } catch (e) {
      value = ErrorProductState(e.toString());
    }
  }
}
