import 'package:flutter/material.dart';
import 'package:flutter_basics/project/notes_app/styles/text_style.dart';

ButtonStyle getButtonStyle({Size? fixedSize}){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.red[500],
    side:const BorderSide(
      color: Colors.black87,
      width: 2,
    ),
    shape:const RoundedRectangleBorder(),
    textStyle: getTextStyle(FontWeight.w600, 20),
    fixedSize: fixedSize,
    padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    elevation: 30,
    animationDuration:const Duration(seconds: 2),
  );
}