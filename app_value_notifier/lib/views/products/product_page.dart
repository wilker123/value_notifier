import 'package:app_value_notifier/states/product_states/product_state.dart';
import 'package:app_value_notifier/stores/product_stores/product_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'form_post_product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context.read<ProductStore>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ProductStore>();
    final state = store.value;
    Widget? child;

    if (state is LoadingProductState) {
      child = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is ErrorProductState) {
      child = Center(
        child: Text(state.message),
      );
    }

    if (state is SucessProductState) {
      child = ListView.builder(
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final products = state.products[index];
          return ListTile(
            title: Text(products.title),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Notifier!"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FormPostProduct(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: child ?? Container(),
    );
  }
}
