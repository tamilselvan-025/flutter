import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String _data;
  const SecondScreen(this._data,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(child: Text(_data),),
    );
  }
}
