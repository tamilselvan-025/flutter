import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var rotation = ValueNotifier(0.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container rotation"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: rotation,
          builder: (context, value, child) {
            return Transform.rotate(
              angle: value * (3.14 / 180),
              child: child,
            );
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("container child"),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (rotation.value >= 360) {
            rotation.value = -30;
          }
          rotation.value = rotation.value + 30;
        },
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}
