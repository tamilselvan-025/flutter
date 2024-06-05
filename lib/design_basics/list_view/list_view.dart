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
        title: const Text("List View"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 400,
              margin:const EdgeInsets.all(30),
              decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
              child: ListView(
                //clipBehavior:Clip.antiAliasWithSaveLayer,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding:const EdgeInsets.all(30),
                reverse: true,
                physics:const BouncingScrollPhysics(),
                cacheExtent:300,
                itemExtent: 300,
                //shrinkWrap:true,
                //scrollDirection:Axis.horizontal ,
                children: [
                  Container(color: Colors.green,alignment: Alignment.center,child: const Text("1"),),
                  Container(color: Colors.blue,alignment: Alignment.center,child: const Text("2"),),
                  Container(color: Colors.orange,alignment: Alignment.center,child: const Text("3"),),
                  Container(color: Colors.pink,alignment: Alignment.center,child: const Text("4"),),
                  Container(color: Colors.purple,alignment: Alignment.center,child: const Text("5"),),
                ],
              ),
            ),
            Container(
              color: Colors.cyan,
              height: 100,
              child: const TextField(),
            ),

          ],
        ),
      )
    );
  }
}
