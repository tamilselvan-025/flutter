import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  static String routeName='/first';
  const FirstPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("First Page Contents"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text("Second Page"))
          ],
        ),
      ),
    );
  }
}
