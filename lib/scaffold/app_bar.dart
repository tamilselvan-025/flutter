import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("AppBar"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          titleTextStyle: const TextStyle(
              backgroundColor: Colors.cyanAccent,
              fontWeight: FontWeight.w700, //FontWeight.w700 == bold
              fontSize: 40,
              color: Colors.black),
          bottom: AppBar(
            title: const Text("Bottom app bar"),
            backgroundColor: Colors.blueGrey,
            toolbarOpacity: 0.5,
            shape: const Border(
                top: BorderSide(
                    color: Colors.black26, style: BorderStyle.solid, width: 3)),
          ),
        ),
      ),
    );
  }
}
