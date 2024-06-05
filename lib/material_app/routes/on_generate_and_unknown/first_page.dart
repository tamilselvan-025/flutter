import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String _name;

  const FirstPage(this._name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: Text("Hi $_name"),
      ),
    );
  }
}
