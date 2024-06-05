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
        title: const Text("AppBar"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: const Text("ujguksuihuhd"),
            ),

            SizedBox(
              height: 800,
              child: ListView(
                shrinkWrap: true,
                //clipBehavior:Clip.antiAliasWithSaveLayer,
                //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(30),
                //reverse: true,
               // physics: NeverScrollableScrollPhysics(),
                cacheExtent: 300,
                itemExtent: 300,
                //shrinkWrap:true,
                //scrollDirection:Axis.horizontal ,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                    child: const Text("A"),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text("1"),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text("2"),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text("3"),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.pink,
                    alignment: Alignment.center,
                    child: const Text("4"),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: const Text("5"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
