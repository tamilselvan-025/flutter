import 'package:flutter/material.dart';
import 'package:flutter_basics/key_problem/example_1/switch_page.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen3"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton( onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
      },child: const Text("Next"),),
    );
  }
}
