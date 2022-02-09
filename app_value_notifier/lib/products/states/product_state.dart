import 'package:app_value_notifier/products/models/product_model.dart';

abstract class ProductState {}

class InitialProductState implements ProductState {}

class SucessProductState implements ProductState {
  final List<ProductModel> products;
  SucessProductState(this.products);
}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;
  ErrorProductState(this.message);
}

// Inicial, Sucess, Error, Loading
