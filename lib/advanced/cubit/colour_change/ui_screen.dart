import 'package:flutter/material.dart';
import 'package:flutter_basics/advanced/cubit/colour_change/color_cubit.dart';
import 'package:flutter_basics/advanced/cubit/colour_change/colour_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<ColorCubit>(
      create: (_) => ColorCubit(),
      child: const MaterialApp(
        home: Home(),
      )));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ColorCubit"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: BlocBuilder<ColorCubit, ColorState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Color : ${state.name}"),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 200,
                  width: 200,
                  color: state.color,
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ColorCubit>(context).changeColor();
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}
