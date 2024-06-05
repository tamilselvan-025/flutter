import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    StreamProvider<int>(
      create: (_) {
        debugPrint("StreamProvider called");
        return _getNumbers();
      },
      initialData: 0,
    ),
  ],
    child: const MaterialApp(
      home: Home(),
    ),
  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Provider"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Consumer<int>(builder: (context, value, child) {
          debugPrint("Provider.of<int>(context) : ${Provider.of<int>(context,listen: false)}");
          return Text("Number : $value");
        }),
      ),
    );
  }
}

Stream<int> _getNumbers() async* {
  debugPrint("--------------------getNumbers called--------------------");
  for (int i = 1; i <= 100; i++) {
    await Future.delayed(const Duration(seconds: 1));

    yield i;
  }
}