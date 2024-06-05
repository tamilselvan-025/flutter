import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  static String routeName='/fourth';
  const FourthPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fourth Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Fourth Page Contents"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Bach to Home")),
          ],
        ),
      ),
    );
  }
}
