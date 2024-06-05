import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    debugPrint('home build called');
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: Colors.cyan,
          titleTextStyle:
          const TextStyle(height: 2),
          title: const Text(
            'StateFul Widget',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
      ),
      body: const Counter(),
    );
  }
}
class Counter extends StatefulWidget {
  const Counter();
  @override
  State<StatefulWidget> createState() {
    debugPrint('counter createState called');
    return _Counter();
  }
}

class _Counter extends State<Counter> {
  int _count = 0;

  @override
  void initState() {
    debugPrint('counter initState  called');
    debugPrint('mounted $mounted');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    debugPrint('counter build called');
    return Column(
      children: [
        Text(
          "You has pressed the button $_count times",
          style: const TextStyle(
              color: Colors.blueGrey
          ),
        ),
        FloatingActionButton(onPressed: (){
          setState(() {
            debugPrint('counter setState called');
            _count++;
          });
        })
      ],
    );
  }
}