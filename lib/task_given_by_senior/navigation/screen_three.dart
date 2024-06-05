import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final String? navigation;

  const ThirdScreen({this.navigation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ThirdScreen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(navigation == null ? "" : navigation!),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/', arguments: 'Screen 3 to Screen 1');
              },
              child: const Text("Screen 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/second', arguments: 'Screen 3 to Screen 2');
              },
              child: const Text("Screen 2"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/fourth', arguments: 'Screen 3 to Screen 4');
              },
              child: const Text("Screen 4"),
            ),
          ],
        ),
      ),
    );
  }
}
