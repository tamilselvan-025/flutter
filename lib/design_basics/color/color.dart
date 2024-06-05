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
        title: const Text("Color"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red.shade100,
              child: const Text("Colors.red.shade100"),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 100,
              width: 100,
              color:const Color.fromRGBO(20,30,150,0.7),
              child: const Text(" Color.fromRGBO(20,30,150,0.7)"),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 100,
              width: 100,
              color:const Color(0xFF1B5E20),
              child: const Text("Color(0xFF1B5E20)"),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue[200],
              child: const Text("Colors.blue[200]"),
            ),
          ],
        ),
      ),
    );
  }
}
