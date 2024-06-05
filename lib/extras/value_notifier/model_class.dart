import 'package:flutter/cupertino.dart';

class Counter extends ValueNotifier{
  Counter(super.value);
  void increment(){
    value++;
  }
}