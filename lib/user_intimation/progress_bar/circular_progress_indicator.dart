import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basics/user_intimation/progress_bar/linear_progress_indicator.dart';

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
  double _progressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        // Update the progress value by 0.1 every second
        if (_progressValue < 0.9) {
          _progressValue += 0.1;
        } else {
          _timer?.cancel(); // Stop the timer when progress reaches 100%
          Navigator.pushReplacement(context ,MaterialPageRoute(builder: (context)=>const DemoScreen()));
        }
      }
      );
    }
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('CircularProgressIndicator Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Progress: ${(_progressValue * 100).toStringAsFixed(1)}%'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircularProgressIndicator(
                value: _progressValue,
                strokeAlign: 4,//used to increase the size of the progress bar
                backgroundColor: Colors.blue[100],
                color: Colors.blue,
                strokeWidth: 6,

              ),
            ),
          ],
        ),
      ),
    );
  }
}


