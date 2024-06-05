import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static String routeName='/second';
  const SecondPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Second Page Contents"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: const Text("third Page"))
          ],
        ),
      ),
    );
  }
}
