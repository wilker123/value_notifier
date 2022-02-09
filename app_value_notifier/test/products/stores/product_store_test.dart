import 'package:app_value_notifier/products/services/products_services.dart';
import 'package:app_value_notifier/products/states/product_state.dart';
import 'package:app_value_notifier/products/stores/product_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class ProductServiceMock extends Mock implements ProductsService {}

void main() {
  final service = ProductServiceMock();
  final store = ProductStore(service);

  test("Deve alterar estado para sucesso", () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);

    expect(
      store,
      emitValues(
        [
          isA<LoadingProductState>(),
          isA<SucessProductState>(),
        ],
      ),
    );
    await store.fetchProducts();
  });

  test("deve alterar o estado para error", () async {
    when(() => service.fetchProducts()).thenThrow(Exception("Error"));

    expect(
      store,
      emitValues(
        [
          isA<LoadingProductState>(),
          isA<ErrorProductState>(),
        ],
      ),
    );
    await store.fetchProducts();
  });

  /* test("Deve alterar estado para sucesso", () async {
    when(() => service.fetchProducts()).thenAnswer((_) async => []);
    await store.fetchProducts();
    expect(store.value, isA<SucessProductState>());
  });

  test("deve alterar o estado para error", () async {
    when(() => service.fetchProducts()).thenThrow(Exception("Error"));
    await store.fetchProducts();
    expect(store.value, isA<ErrorProductState>());
  });*/
}
