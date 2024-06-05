import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class Name extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      _Name();
}

class _Name extends State<Name> {
  String name = "No Name";

  Future<String> getName() => Future.delayed(
      const Duration(seconds: 2),
      () => "Tamil");

  void click() async {
    debugPrint("click called");
    name = await getName();
    debugPrint("name value got : $name");
    setState(() {
      debugPrint("Set State called");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("NAME : $name"),
        FloatingActionButton(
            onPressed: click)
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "setState() with Future"),
      ),
      body: Name(),
    );
  }
}
