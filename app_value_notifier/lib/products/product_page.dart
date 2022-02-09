import 'package:app_value_notifier/products/states/product_state.dart';
import 'package:app_value_notifier/products/stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:uno/uno.dart';

import 'services/products_services.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final store = ProductStore(ProductsService(Uno()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
        ),
        body: ValueListenableBuilder(
          valueListenable: store,
          builder: (context, state, child) {
            if (state is LoadingProductState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ErrorProductState) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is SucessProductState) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (_, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text("${product.title}"),
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
