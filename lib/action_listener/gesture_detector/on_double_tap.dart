import 'package:flutter/material.dart';

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
  bool _isRed=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("onDoubleTap"),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: GestureDetector(

            onDoubleTap:(){
              setState(() {
                _isRed=!_isRed;
              });
            } ,
            child: Container(
              height: 300,
              width: 400,
              color: _isRed?Colors.red:Colors.green,
              alignment: Alignment.center,
              child: const Text("Text"),
            ),
          )
      ),
    );
  }
}
