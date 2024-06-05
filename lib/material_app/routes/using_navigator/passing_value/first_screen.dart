import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/passing_value/second_screen.dart';

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

class _HomeState extends State<Home> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>  SecondScreen(_textEditingController.text)));
              },
              child: const Text("Next Page"),
            )
          ],
        ),
      ),
    );
  }
}
