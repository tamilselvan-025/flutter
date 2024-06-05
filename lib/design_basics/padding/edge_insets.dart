import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EdgeInsets Constructors Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EdgeInsets Constructors'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('EdgeInsets.only(top: 8, bottom: 8)'),
            const SizedBox(height: 8),
            Container(
              color: Colors.blue,
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(top: 8, bottom: 8),
            ),
            const SizedBox(height: 16),
            const Text('EdgeInsets.symmetric(vertical: 16, horizontal: 8)'),
            const SizedBox(height: 8),
            Container(
              color: Colors.red,
              height: 100,
              width: 100,
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            ),
            const SizedBox(height: 16),
            const Text('EdgeInsets.fromLTRB(8, 16, 8, 16)'),
            const SizedBox(height: 8),
            Container(
              color: Colors.green,
              height: 100,
              width: 100,
              margin: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            ),
          ],
        ),
      ),
    );
  }
}
