import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextButton"),
      ),

      body: Center(

        child: TextButton(onPressed: () {
          debugPrint("TextButton pressed");
        },
            child: const Text("TextButton")),
      ),
    );
  }
}
