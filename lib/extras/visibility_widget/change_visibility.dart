import 'package:flutter/material.dart';

class ChangeVisibility extends ChangeNotifier{

  bool isVisible=true;
  String text="hide";

  void changeVisibility(){
    isVisible=!isVisible;
    text=isVisible?"Hide":"Show";
    notifyListeners();
  }
}