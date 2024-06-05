import 'package:flutter/material.dart';

SnackBar getSnackBarNote(Widget data,SnackBarAction?snackBarAction) {
  return SnackBar(
    action:snackBarAction,
    closeIconColor: Colors.green,
    content: data,

    duration: const Duration(seconds: 2),
    backgroundColor: Colors.red[400],
    padding: const EdgeInsets.all(10),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.elliptical(10, 5), left: Radius.elliptical(10, 5)),
      side: BorderSide(
        color: Color(0xFFD32F2F),
        width: 2,
      ),
    ),
    elevation: 20,
    //showCloseIcon: true,
  );
}