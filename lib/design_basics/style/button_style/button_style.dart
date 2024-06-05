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
        title: const Text("Button Style"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          style:ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.yellow,
            shape:const RoundedRectangleBorder(),
            fixedSize:const Size(300,100),
            elevation: 20,
            shadowColor: Colors.black,
            side: const BorderSide(color: Colors.black,width: 2,),
          ),
          child: const Text("Click"),
        ),
      ),
    );
  }
}
