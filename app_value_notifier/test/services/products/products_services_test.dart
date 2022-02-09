import 'dart:convert';
import 'package:app_value_notifier/services/products/products_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}

class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();
  final service = ProductsService(unoMock);

  test("Deve pegar todos os produtos", () async {
    when(() => unoMock.get(any())).thenAnswer(
      (_) async => Response(
        data: jsonResponse,
        headers: {},
        status: 200,
        request: RequestMock(),
      ),
    );
    final products = await service.fetchProductsService();
    expect(products[0].title, 'Flutter 2');
  });
}

final jsonResponse = jsonDecode('''
  [{"id":"0","title":"Flutter 2"},{"id":"1","title":"React Native"},{"title":"Ionic","id":"2"}]
''');
