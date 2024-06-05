import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/first_screen.dart';

void main() {
  runApp(const MaterialApp(
    home: ColorStreamExample(),
  ));
}

class ColorStreamExample extends StatefulWidget {
  const ColorStreamExample({super.key});

  @override
  State<ColorStreamExample> createState() => _ColorStreamExampleState();
}

class _ColorStreamExampleState extends State<ColorStreamExample> {
  StreamSubscription<Color>? subscription;
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _activateSubscription();
  }

  void _activateSubscription() {
    subscription = _createColorStream().listen((color) {
      setState(() {
        backgroundColor = color;
      });
    });
  }

  Stream<Color> _createColorStream() async* {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
    ];
    int index = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield colors[index % colors.length];
      debugPrint("[index % colors.length : ${index % colors.length}");
      index++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Stream Example'),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        color: backgroundColor,
        child: const Center(
          child: Text(
            'background color change!',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await subscription!.cancel().then((_) async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstScreen()));
        });
        _activateSubscription();
      }),
    );
  }
}
