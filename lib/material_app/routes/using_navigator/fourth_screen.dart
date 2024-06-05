import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Screen"),
      ),
      body: Column(
        children: [
          const Text("Contents in Fourth screen"),
          FloatingActionButton(onPressed: () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
