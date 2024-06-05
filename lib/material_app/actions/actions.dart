import 'package:flutter/material.dart';
//this code not yet completed
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
        title: const Text("Home"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(children: [
        const Center(
          child: Text("Hi...!"),
        ),
        ElevatedButton(onPressed: () {
         // Action<MyIndent>indent=Action
        }, child: const Text("Click Here"))
      ]),
    );
  }
}
class MyIndent extends Intent{
  const MyIndent();
}