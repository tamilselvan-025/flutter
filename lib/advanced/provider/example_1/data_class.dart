import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier {
  int integerData = 0;

  void increment() {
    integerData++;
    notifyListeners();
  }

  void decrement() {
    integerData--;
    notifyListeners();
  }
}
