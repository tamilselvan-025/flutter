import 'package:flutter/material.dart';
import 'package:flutter_basics/material_app/routes/using_navigator/fourth_screen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Screen"),
      ),
      body: Column(
        children: [
          const Text("Contents in Third screen"),
          FloatingActionButton(onPressed: () {
            Navigator.pop(context);
          }),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FourthScreen()));
              },
              child: const Text("FourthPage")),
        ],
      ),
    );
  }
}
