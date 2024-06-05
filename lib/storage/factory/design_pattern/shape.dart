
import 'package:flutter/material.dart';

enum ShapeType { triangle, circle, square }

abstract class Shape {
  factory Shape(ShapeType shapeType) {
    if (shapeType == ShapeType.triangle) {
      return _Triangle();
    }
    if (shapeType == ShapeType.circle) {
      return _Circle();
    }
    return _Square();
  }

  void draw();
}

class _Triangle implements Shape {
  @override
  void draw() {
    debugPrint("Triangle");
  }
}

class _Circle implements Shape {
  @override
  void draw() {
    debugPrint("Circle");
  }
}

class _Square implements Shape {
  @override
  void draw() {
    debugPrint("Square");
  }
}
