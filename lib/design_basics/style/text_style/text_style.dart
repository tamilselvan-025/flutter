import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Style"),
      ),
      body: const Center(
        child: Text("Text Widget",style: TextStyle(
          backgroundColor: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 40,
          //decorationThickness: 5,
          color: Colors.red,
          height: 4,
          fontStyle: FontStyle.italic,
          fontFamily: 'Times',
          letterSpacing: 10,
          wordSpacing: 30,
          decoration: TextDecoration.underline,
          decorationThickness: 3,
          decorationColor: Colors.red,
          decorationStyle:TextDecorationStyle.dashed,
          shadows: [
            Shadow(
              color: Colors.black,blurRadius: 2,
              offset: Offset(10,20),
            ),
            Shadow(
              color: Colors.green,blurRadius: 4,
              offset: Offset(5,5),
            ),
          ],


          ),
        ),
      ),
    );
  }
}
