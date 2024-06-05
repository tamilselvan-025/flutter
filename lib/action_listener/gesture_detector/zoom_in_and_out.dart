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
        title: const Text("GestureDetector"),
        backgroundColor: Colors.red,
      ),
      body: GestureDetector(
        onPanStart: (_) {
          debugPrint('Pan(Zoom) Start');
        },
        onPanEnd: (_) {
          debugPrint('Pan(Zoom) End');
        },

        child: Center(
          child: Container(
            height: 200,
            width: 300,
            color: Colors.green,
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Text'),
            ),
          ),
        ),
      ),
    );
  }
}
