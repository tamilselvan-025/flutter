import 'package:flutter/cupertino.dart';

class NoteCounter extends ChangeNotifier {
  int count =0;


  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
