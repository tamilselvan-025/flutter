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
        title: const Text('BorderRadius'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 200,
              decoration:const BoxDecoration(color: Colors.red,borderRadius:
              BorderRadius.all(Radius.circular(50))),
              child: const Text(""),
            )
          ],
        ),
      ),
    );
  }
}
