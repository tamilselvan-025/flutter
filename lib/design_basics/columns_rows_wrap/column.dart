import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        //verticalDirection:VerticalDirection.up,//works like stack
        children: [
          Container(
            height: 100,
            width: 30,
            color: Colors.red[900],
            child: const Text("Child 1"),
          ),
          Container(
            height: 100,
            width: 50,
            color: Colors.red[600],
            child: const Text("Child 2"),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red[300],
            child: const Text("Child 3"),
          ),
          Container(
            height: 100,
            width: 200,
            color: Colors.red[100],
            child: const Text("Child 4"),
          ),
        ],
      ),
    );
  }
}
