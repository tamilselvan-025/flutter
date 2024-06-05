import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Padding'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent[400],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.fromLTRB(50, 120, 10, 10),
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
            child: const Text(
              'Text Widget',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  );
}
