import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> list = [const Text("Text1"), const Text("Text2")];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KeyProblem'),
      ),
      body: Column(
        children: [
          list[0],
          list[1],
          ElevatedButton(
            child: const Text("Swap"),
            onPressed: () {
              list.insert(1, list.removeAt(0));
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
