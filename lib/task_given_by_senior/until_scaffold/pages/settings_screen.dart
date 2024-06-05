import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Text("FirstPage"),
      floatingActionButton: FloatingActionButton(onPressed:() {
        Navigator.popAndPushNamed(context, '/home');
      }, child:const Icon(Icons.arrow_forward),),
    );
  }
}
