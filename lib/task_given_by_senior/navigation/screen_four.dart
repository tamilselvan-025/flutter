import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  final String? navigation;

  const FourthScreen({this.navigation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FourthScreen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(navigation == null ? "" : navigation!),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/', arguments: 'Screen 4 to Screen 1');
              },
              child: const Text("Screen 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/second', arguments: 'Screen 4 to Screen 2');
              },
              child: const Text("Screen 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/third', arguments: 'Screen 4 to Screen 3');
              },
              child: const Text("Screen 3"),
            ),
          ],
        ),
      ),
    );
  }
}
