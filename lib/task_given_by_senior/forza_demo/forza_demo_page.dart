import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp());
}
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Trip List"),),);
  }
}
