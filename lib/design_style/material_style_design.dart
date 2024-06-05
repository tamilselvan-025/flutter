import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Material Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return  AlertDialog(
                title:const Text('Material Alert Dialog'),
                content:const Text('This is an example of a Material alert dialog.'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
          child:const Text('Show Material Alert Dialog'),
        ),
      ),
    );
  }
}