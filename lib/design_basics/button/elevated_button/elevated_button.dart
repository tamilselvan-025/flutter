import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // double _elevation = 10;
  bool _isRed = true;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevated Button'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _isRed
                  ? "Text colour changed to red"
                  : "Text colour changed to blue",
              style: TextStyle(color: _isRed ? Colors.red : Colors.blue),
            ),
          ),

          ElevatedButton(

            onPressed: () {
              _isRed = !_isRed;
              debugPrint('pressed');
              setState(() {});
            },
            onHover: (value){
              debugPrint('onHover');
              if(!value){
                Navigator.pop(context);
              }
            },

            onLongPress: () {
              debugPrint('long pressed');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ElevatedScreen()));
              setState(() {});
            },
            child: const Text(
              "ElevatedButton",
            ),
          ),
        ],
      ),
    );
  }
}

class ElevatedScreen extends StatelessWidget {
  const ElevatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ElevatedScreen"),
      ),
    );
  }
}
