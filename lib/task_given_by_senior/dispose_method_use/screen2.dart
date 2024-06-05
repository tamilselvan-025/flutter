import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text("Screen 2"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint("Screen2 dispose() called");
    super.dispose();
  }
}
