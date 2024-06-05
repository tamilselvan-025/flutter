import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String? navigation;

  const SecondScreen({this.navigation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondScreen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(navigation == null ? "" : navigation!),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/', arguments: 'Screen 2 to Screen 1');
              },
              child: const Text("Screen 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/third', arguments: 'Screen 2 to Screen 3');
              },
              child: const Text("Screen 3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/fourth', arguments: 'Screen 2 to Screen 4');
              },
              child: const Text("Screen 4"),
            ),
          ],
        ),
      ),
    );
  }
}
