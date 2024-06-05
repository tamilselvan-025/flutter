import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/cubit/colour_change/colour_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit() : super(ColorState(color: Colors.green, name: "Green"));

  void changeColor() {
    if(state.name=="Green"){
      emit(ColorState(color: Colors.blue, name: "Blue"));
    }
    else{
      emit(ColorState(color: Colors.green, name: "Green"));
    }
  }
}
