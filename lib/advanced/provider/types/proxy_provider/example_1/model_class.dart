import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
  int _value=0;
  int get value=>_value;
  void increment(){
    _value++;
    notifyListeners();
  }
}

class Logger{
  Counter counter;
  Logger(this.counter);
  void log() {
    debugPrint("Value of the counter is ${counter.value}");
  }
}