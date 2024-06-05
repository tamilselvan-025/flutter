import 'package:flutter/material.dart';

//Not the way to code (it rebuilds the entire UI)
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<StatefulWidget> createState() {
    debugPrint('create state called');
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int _count = 0;

  @override
  void initState() {
    debugPrint('init state  called');
    debugPrint('mounted $mounted');
    super.initState();
  }

  void click() {
    debugPrint('click called');
    setState(() {
      debugPrint('set state called');
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('home build called');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.cyan,
        titleTextStyle: const TextStyle(height: 2),
        title: const Center(
            child: Text(
          'StateFul Widget(1)',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        )),
      ),
      body: Column(
        children: [
          Text("You has pressed the button $_count times"),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                debugPrint('set state called');
                _count++;
              });
            },
          ),
        ],
      ),
    );
  }
}
