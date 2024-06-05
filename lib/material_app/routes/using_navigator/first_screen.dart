import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // to remove the arrow mark (<-) symbol
        title: const Text("First Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Contents in first screen"),
            FloatingActionButton(
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
