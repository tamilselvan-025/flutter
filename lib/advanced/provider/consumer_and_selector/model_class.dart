import 'package:flutter/cupertino.dart';

class ExampleModelClass extends ChangeNotifier{
  int integerValue=10;
  String stringValue="";

  void addInteger(){
    integerValue++;
    notifyListeners();
  }
  void addString(){
    stringValue="${stringValue}t";
    notifyListeners();
  }
}