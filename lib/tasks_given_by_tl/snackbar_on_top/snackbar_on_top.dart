import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBar without margin"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Flushbar(
              title: "title",
              duration: const Duration(seconds: 3),
              flushbarPosition:FlushbarPosition.TOP ,
              message: "Snack bar on top without using margin",
            ).show(context);
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}
