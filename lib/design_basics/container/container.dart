import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  )
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.horizontal(
                  right: Radius.elliptical(15, 50),
                  left: Radius.elliptical(15, 50)),
            border: Border.all(color: Colors.black,width: 2,),
            boxShadow:const [BoxShadow(color: Colors.red,blurRadius: 40,
                spreadRadius: 20),BoxShadow(color: Colors.green,blurRadius:
            1,spreadRadius: 5)],
            gradient:const LinearGradient(colors: [Colors.red,Colors.pink,Colors
                .orangeAccent,Colors.yellow,Colors.blue,Colors.cyan]),
          ),
          transform: Matrix4.rotationZ(0.2),
          child: const Text("Child Widget"),

        ),
      ),
    );
  }
}
