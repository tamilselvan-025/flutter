import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Flutter Toast Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _showToast();
            },
            child:const Text('Show Toast'),
          ),
        ),
      ),
    );
  }

  void _showToast() {
    Fluttertoast.showToast(

      msg: 'This is a toast message',
      toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should be visible
      gravity: ToastGravity.TOP, // Position of the toast on the screen
      //timeInSecForIosWeb: 1, // Specific to iOS/web
      backgroundColor: Colors.grey, // Background color of the toast
      textColor: Colors.white, // Text color of the toast message
      fontSize: 16.0, // Font size of the toast message
    );
  }
}
