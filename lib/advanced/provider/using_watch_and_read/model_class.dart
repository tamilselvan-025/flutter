
import 'package:flutter/cupertino.dart';

class ExampleModelClass extends ChangeNotifier{
  String _value='';
  get value => _value;
  void changeValue(String newValue){
    if(newValue.isNotEmpty){
      _value=newValue;
      notifyListeners();
    }
  }
}