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
        title: const Text("Wrap"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          height: 500,
          color: Colors.cyan,
          child: Wrap(
            spacing: 10,
            runSpacing: 20,
            textDirection:TextDirection.rtl,
            //direction: Axis.vertical,
            runAlignment:WrapAlignment.center,
            verticalDirection:VerticalDirection.up ,
            alignment: WrapAlignment.center,
            crossAxisAlignment:WrapCrossAlignment.center,
            children: [
              Container(
                height: 10,
                width: 100,
                color: Colors.deepPurple,
                child: const Text('1',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 20,
                width: 100,
                color: Colors.black87,
                child: const Text('2',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 30,
                width: 100,
                color: Colors.red,
                child: const Text('3',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 40,
                width: 100,
                color: Colors.black87,
                child: const Text('4',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.red,
                child: const Text('5',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 60,
                width: 100,
                color: Colors.black87,
                child: const Text('6',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 70,
                width: 100,
                color: Colors.red,
                child: const Text('7',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 80,
                width: 100,
                color: Colors.black87,
                child: const Text('8',style: TextStyle(color: Colors.yellow),),
              ),
              Container(
                height: 90,
                width: 100,
                color: Colors.green,
                child: const Text('9',style: TextStyle(color: Colors.yellow),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
