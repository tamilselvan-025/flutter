import 'dart:async';

import 'package:flutter/material.dart';

class StreamGenerator {

  StreamController _streamController=StreamController();


  StreamGenerator(){
    _streamController.addStream(_getNumbers());
  }
  Stream<int> _getNumbers() async* {
    debugPrint("--------------------getNumbers called--------------------");

    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}