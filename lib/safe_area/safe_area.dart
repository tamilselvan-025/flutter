import 'package:flutter/material.dart';

void main() {
  runApp(SafeArea(
    child: MaterialApp(
      home: Demo(),
    ),
  ));
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safe Area"),
        backgroundColor: Colors.cyan,
        toolbarHeight: 70,
      ),
      body: const Center(
        child: Text("Message"),
      ),
    );
  }
}
