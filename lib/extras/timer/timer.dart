import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics/user_intimation/snack_bar.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? timer;
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StopWatch"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$count'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                    setState(() {
                      count++;
                    });
                  });
                },
                child: const Text("Start")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (timer != null) {
                    debugPrint('timer!=null if called');
                    if (timer!.isActive) {
                      debugPrint('timer!.isActive if called');
                      timer!.cancel();
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(getSnackBar(const Text("StopWatch is already stopped"), context));
                    }
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(getSnackBar(const Text("StopWatch is not yet started"), context));
                  }
                },
                child: const Text("Stop")),
          ],
        ),
      ),
    );
  }
}
