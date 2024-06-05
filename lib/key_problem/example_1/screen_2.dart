import 'package:flutter/material.dart';
import 'package:flutter_basics/key_problem/example_1/screen_3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen2"),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Screen3()));
      },child: const Text("Next"),),
    );
  }
}
