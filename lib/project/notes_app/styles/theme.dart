import 'package:flutter/material.dart';
import 'package:flutter_basics/project/notes_app/styles/button_style.dart';
import 'package:flutter_basics/project/notes_app/styles/text_style.dart';

ThemeData getThemeData(){
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 30,
      titleTextStyle: getTextStyle(FontWeight.bold, 30),
      centerTitle: true,
    ),
    buttonTheme:ButtonThemeData(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      shape: const RoundedRectangleBorder(),
      height: 50,
      buttonColor:  Colors.red[500],
      splashColor: Colors.red[200],
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: getButtonStyle(),
    ),
    listTileTheme: ListTileThemeData(
      style:ListTileStyle.drawer,
      shape:const StadiumBorder(),
      titleTextStyle: getTextStyle(FontWeight.w600, 20),
      contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      dense: true,
      horizontalTitleGap: 20,
      minLeadingWidth: 40,
      selectedTileColor: Colors.red[900],
      tileColor: Colors.red[100],
    ),
  );
}