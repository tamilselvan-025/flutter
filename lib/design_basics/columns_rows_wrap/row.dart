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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column"),
        backgroundColor: Colors.cyan,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 100,
            color: Colors.red[900],
            child: const Text("Child 1"),
          ),
          Container(
            height: 60,
            width: 100,
            color: Colors.red[600],
            child: const Text("Child 2"),
          ),
          Container(
            height: 90,
            width: 100,
            color: Colors.red[300],
            child: const Text("Child 3"),
          ),

        ],
      ),
    );
  }
}
