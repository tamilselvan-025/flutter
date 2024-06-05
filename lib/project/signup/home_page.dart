import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String _name;
  const Home(this._name,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Home Page"),backgroundColor:Colors.blue),
    body: Center(child: Text("Hi $_name"),),
    );
  }
}
