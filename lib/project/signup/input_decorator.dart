import 'package:flutter/material.dart';

InputDecoration loginInputDecorator(
    {required String hintText, required IconData prefixIcon, required String labelWidgetText,
      Widget? suffixIcon}) {
  return InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.black26,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.elliptical(30, 30),
        right: Radius.elliptical(30, 30),
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.redAccent,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.elliptical(30, 30),
        right: Radius.elliptical(30, 30),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.elliptical(30, 30),
        right: Radius.elliptical(30, 30),
      ),
      borderSide: BorderSide(width: 3, color: Colors.black26),
    ),
    contentPadding: const EdgeInsets.only(left: 12, top: 20, bottom: 20),
    hintStyle: const TextStyle(color: Colors.black26),
    focusColor: Colors.white30,
    counterText: '',
    hintText: hintText,
    prefixIcon: Icon(
      prefixIcon,
      color: Colors.blueAccent,
      size: 30,
    ),
    label: Text(
      labelWidgetText,
      style: const TextStyle(
        color: Colors.blueAccent,
      ),
    ),
    suffixIcon: suffixIcon,
  );
}
