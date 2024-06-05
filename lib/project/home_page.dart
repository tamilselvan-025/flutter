import 'column_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text("CURRENCY CALCULATOR"),
        titleTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        toolbarHeight: 60.0,
      ),
      body: const Center(
        child: ColumnContents(),
      ),
    );
  }
}
