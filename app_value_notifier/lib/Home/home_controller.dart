import 'package:flutter/material.dart';

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value++;
}



//class HomeController extends ChangeNotifier {
  //var counter$ = ValueNotifier(0);

  //int get counter => counter$.value;

  //void increment() => counter$.value++;
//}
