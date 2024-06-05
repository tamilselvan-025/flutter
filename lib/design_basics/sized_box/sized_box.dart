import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 20,
              child: Text("Sized Box Child Widget"),
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
