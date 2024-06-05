import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {

  final String data;

  const MyInheritedWidget({super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
     return oldWidget.data!=data;
  }
  static MyInheritedWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

}