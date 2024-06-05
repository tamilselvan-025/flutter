
import 'package:flutter/material.dart';
import 'package:flutter_basics/storage/factory/design_pattern/shape.dart';

void main(){
  runApp(const MaterialApp());
  Shape triangle=Shape(ShapeType.triangle);
  Shape circle =Shape(ShapeType.circle);
  Shape square=Shape(ShapeType.square);

  triangle.draw();
  circle.draw();
  square.draw();
}