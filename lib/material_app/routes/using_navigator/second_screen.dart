import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Contents in second screen"),
            FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/third');
              },
              child: const Text("Third Page"),
            ),
          ],
        ),
      ),
    );
  }
}
