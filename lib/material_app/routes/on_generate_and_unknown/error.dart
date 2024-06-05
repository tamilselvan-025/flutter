import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final dynamic _data;
  const ErrorScreen(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body:  Center(
        child: Text("ERROR! and args (${_data.runtimeType}->$_data)"),
      ),
      backgroundColor: Colors.red,
    );
  }
}
